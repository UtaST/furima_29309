class ItemTag
  include ActiveModel::Model
  attr_accessor :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :tag_name

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

  def save
    item = Item.create(
      name: name,
      explanation: explanation,
      category_id: category_id,
      condition_id: condition_id,
      shipping_charge_id: shipping_charge_id,
      prefecture_id: prefecture_id,
      days_until_shipping_id: days_until_shipping_id,
      price: price,
      user_id: current_user.id
    )

    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end
