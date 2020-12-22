require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do

    context 'ユーザー情報' do
      it "nicknameが必須であること" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが必須であること" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        binding.pry
        expect(another_user.errors.full_messages).to include("")
      end

      it "emailは＠を含む必要があること" do
      end

      it "passwordが必須であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは6文字以上での入力が必須であること" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "passwordは半角英数字混合での入力が必須であること" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "passwordは確認用を含めて2回入力すること" do
        @user.password = "123456"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "passwordとpassword_confirmation、値の一致が必須であること" do
        @user.password = "123456"
        @user.password_confirmation = "654321"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

    end


    context '本人情報確認' do

      it "ユーザー本名はfirst_nameが必須であること" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名はlast_nameが必須であること" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名first_nameは全角(漢字・ひらがな・カタカナ)での入力が必須であること" do
        @user.first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名last_nameは全角(漢字・ひらがな・カタカナ)での入力が必須であること" do
        @user.last_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名のフリガナ、kane_first_nameが必須であること" do
        @user.kane_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名のフリガナ、kane_last_nameが必須であること" do
        @user.kane_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名のkane_first_nameは全角(カタカナ)での入力が必須であること" do
        @user.kane_first_name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "ユーザー本名のkane_last_nameは全角(カタカナ)での入力が必須であること" do
        @user.kane_last_name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

      it "生年月日が必須であること" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end

    end

  end

end