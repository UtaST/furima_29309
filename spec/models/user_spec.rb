require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'emailは@を含む必要があること' do
      @user.email = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが5文字以下だと登録できないこと' do
      @user.password = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordは半角英数字混合でないと登録できないこと' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password include both letters and numbers"
    end

    it 'passwordが存在してもpassword_confirmationが空だと登録できないこと' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'first_nameが半角だと登録できないこと' do
      @user.first_name = "hannkaku"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name full_width characters"
    end

    it 'family_nameが空だと登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end

    it 'family_nameが半角だと登録できないこと' do
      @user.family_name = "hannkaku"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name full_width characters"
    end

    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'first_name_kanaが全角カタカナ以外だと登録できないこと' do
      @user.first_name_kana = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana full_width katakana characters"
    end

    it 'family_name_kanaが空だと登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it 'family_name_kanaが全角カタカナ以外だと登録できないこと' do
      @user.family_name_kana = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana full_width katakana characters"
    end

    it 'birthdayが空だと登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
