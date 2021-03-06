require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'image1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'state_idが1では保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end

      it 'cost_idが1では保存できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost Select')
      end

      it 'area_idが1では保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end

      it 'day_idが1では保存できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it 'priceが必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceの範囲が¥300~¥9,999,999の間で,¥300以下の場合' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceの範囲が¥300~¥9,999,999の間で,¥9,999,999以上の場合' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'price半角数字のみ保存可能であること' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
