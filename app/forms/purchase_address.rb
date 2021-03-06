class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "を正しく入力してください"}
    validates :city
    validates :house_number
    validates :tell_number, format: { with: /\A\d+\z/, message: "はハイフン(-)を使用せずに入力してください"}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tell_number: tell_number, purchase_id: purchase.id)
  end
end