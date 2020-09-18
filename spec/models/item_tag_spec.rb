require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  describe '商品出品' do
    before do
      @item_tag = FactoryBot.build(:item_tag)
      @item_tag.image = fixture_file_upload("public/images/test.jpeg")
    end

    it '全ての値が正しく入力されていれば出品できること' do
      expect(@item_tag).to be_valid
    end

    it '画像が空だと出品できないこと' do
      @item_tag.image = nil
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "出品画像を入力してください"
    end
    
    it '商品名が空だと出品できないこと' do
      @item_tag.name = nil
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "商品名を入力してください"
    end

    it '商品説明が空だと出品できないこと' do
      @item_tag.explanation = nil
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "商品の説明を入力してください"
    end

    it 'カテゴリーが選択されていないと出品できないこと' do
      @item_tag.category_id = 0
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "カテゴリーを選択してください"
    end

    it '商品状態が選択されていないと出品できないこと' do
      @item_tag.condition_id = 0
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "商品の状態を選択してください"
    end

    it '配送料の負担が選択されていないと出品できないこと' do
      @item_tag.shipping_charge_id = 0
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "配送料の負担を選択してください"
    end

    it '発送元の地域が選択されていないと出品できないこと' do
      @item_tag.prefecture_id = 0
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "発送元の地域を選択してください"
    end

    it '発送までの日数が選択されていないと出品できないこと' do
      @item_tag.days_until_shipping_id = 0
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "発送までの日数を選択してください"
    end

    it '価格が空だと出品できないこと' do
      @item_tag.price = nil
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "価格を入力してください"
    end

    it '価格が¥300未満だと出品できないこと' do
      @item_tag.price = 200
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "価格は¥300〜9,999,999でのみ設定可能です"
    end

    it '価格が¥10,000,000以上だと出品できないこと' do
      @item_tag.price = 10000000
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "価格は¥300〜9,999,999でのみ設定可能です"
    end

    it '価格が半角数字のみでないと出品できないこと' do
      @item_tag.price = '３００'
      @item_tag.valid?
      expect(@item_tag.errors.full_messages).to include "価格は半角数字で入力してください"
    end
  end
end
