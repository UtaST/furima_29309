require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'textを入力していれば投稿できること' do
      expect(@comment).to be_valid
    end

    it 'textを入力しないと投稿できないこと' do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include 'テキストを入力してください'
    end
  end
end
