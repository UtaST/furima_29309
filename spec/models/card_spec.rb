require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'クレジットカード情報登録' do
    before do
      @card = FactoryBot.build(:card)
    end

    it '全ての値が正しく入力されていれば登録できること' do
      expect(@card).to be_valid
    end

    it 'カード情報正しくが入力されていないと登録できないこと' do
      @card.token = nil
      @card.valid?
      expect(@card.errors.full_messages).to include 'カード情報を入力してください'
    end
  end
end
