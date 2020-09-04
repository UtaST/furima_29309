require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it '全ての値が正しく入力されていれば購入できること' do
      expect(@purchase_address).to be_valid
    end

    it 'カード情報が空だと購入できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
    end
    
    it '発送先の郵便番号が空だと購入できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
    end

    it '発送先の郵便番号が正しく入力されていないと購入できないこと' do
      @purchase_address.postal_code = "3330003"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code input correctly"
    end
    
    it '発送先の都道府県が選択されていないと購入できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
    end

    it '発送先の市区町村が空だと購入できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "City can't be blank"
    end

    it '発送元の番地が空だと購入できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
    end

    it '購入者の電話番号が空だと購入できないこと' do
      @purchase_address.tell_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Tell number can't be blank"
    end

    it '購入者の電話番号にハイフン(-)が含まれていると購入できないこと' do
      @purchase_address.tell_number = "080-080-080"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Tell number can't include hyphen(-)"
    end

  end
end