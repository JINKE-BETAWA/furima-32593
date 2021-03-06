require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:order, item_id: @item.id, user_id: @user.id)
    end

    context '商品購入ができる時' do
      it '必要な情報を適切に入力すると、商品の購入ができる事' do
        expect(@item_order).to be_valid
      end

      it '建物名が抜けていても登録できる事' do
        @item_order.building_number = ''
        expect(@item_order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'user_idが空では登録できない事' do
        @item_order.user_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない事' do
        @item_order.item_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できない事' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it '配送先の情報として、郵便番号が必須である事' do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にはハイフンが必要である事（123-4567となる）' do
        @item_order.post_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '配送先の情報として、都道府県が必須である事' do
        @item_order.area_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Area Select')
      end

      it 'area_idが1以外でないと登録できない事' do
        @item_order.area_id = '1'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Area Select')
      end

      it '配送先の情報として、市区町村が必須である事' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の情報として、番地が必須である事' do
        @item_order.street_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Street number can't be blank")
      end

      it '配送先の情報として、電話番号が必須である事' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にはハイフンは不要で、11桁以内である事（09012345678となる）' do
        @item_order.phone_number = '0901234567899999'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は英数混合では登録できない事' do
        @item_order.phone_number = '090ABCD1234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
