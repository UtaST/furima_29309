require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/test.jpeg")
    end

    it '全ての値が正しく入力されていれば出品できること' do
      expect(@item).to be_valid
    end

    it '画像が空だと出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    
    it '商品名が空だと出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it '商品説明が空だと出品できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end

    it 'カテゴリーが選択されていないと出品できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it '商品状態が選択されていないと出品できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end

    it '配送料の負担が選択されていないと出品できないこと' do
      @item.shipping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
    end

    it '発送元の地域が選択されていないと出品できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end

    it '発送までの日数が選択されていないと出品できないこと' do
      @item.days_until_shipping_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Days until shipping can't be blank"
    end

    it '価格が空だと出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '価格が¥300未満だと出品できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include "Price out of setting range"
    end

    it '価格が¥10,000,000以上だと出品できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price out of setting range"
    end

    it '価格が半角数字のみでないと出品できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price half-width number"
    end

  end
end
