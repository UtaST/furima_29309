class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly"}
    validates :city
    validates :house_number
    validates :tell_number, format: { with: /\A[0-9]+\z/, message: "can't include hyphen(-)"}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tell_number: tell_number, purchase_id: purchase.id)
  end
end