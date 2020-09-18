require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'ユーザー新規登録(本人情報登録)' do
    before do
      @profile = FactoryBot.build(:profile)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@profile).to be_valid
    end
    
    it 'family_nameが空だと登録できないこと' do
      @profile.family_name = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include "苗字を入力してください"
    end
    
    it 'family_nameが半角だと登録できないこと' do
      @profile.family_name = "hannkaku"
      @profile.valid?
      expect(@profile.errors.full_messages).to include "苗字は全角で入力してください"
    end
    
    it 'first_nameが空だと登録できないこと' do
      @profile.first_name = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include "名前を入力してください"
    end

    it 'first_nameが半角だと登録できないこと' do
      @profile.first_name = "hannkaku"
      @profile.valid?
      expect(@profile.errors.full_messages).to include "名前は全角で入力してください"
    end
    
    it 'family_name_kanaが空だと登録できないこと' do
      @profile.family_name_kana = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include "苗字(カナ)を入力してください"
    end
    
    it 'family_name_kanaが全角カタカナ以外だと登録できないこと' do
      @profile.family_name_kana = "ひらがな"
      @profile.valid?
      expect(@profile.errors.full_messages).to include "苗字(カナ)は全角カタカナで入力してください"
    end

    it 'first_name_kanaが空だと登録できないこと' do
      @profile.first_name_kana = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include "名前(カナ)を入力してください"
    end

    it 'first_name_kanaが全角カタカナ以外だと登録できないこと' do
      @profile.first_name_kana = "ひらがな"
      @profile.valid?
      expect(@profile.errors.full_messages).to include "名前(カナ)は全角カタカナで入力してください"
    end

    it 'birthdayが空だと登録できないこと' do
      @profile.birthday = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include "生年月日を入力してください"
    end
  end
end
