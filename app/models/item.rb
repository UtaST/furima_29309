class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_until_shipping
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 0, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_until_shipping_id
  end

  validates :price, numericality: { message: "は半角数字で入力してください"}
  validates :price, numericality: { greater_than_or_equal_to:300, less_than: 10000000, message: "は¥300〜9,999,999でのみ設定可能です" } 
end
