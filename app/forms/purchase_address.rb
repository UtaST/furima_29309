class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :buliding_name, :tell_number

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, buliding_name: buliding_name, tell_number: tell_number, purchase_id: purchase.id)
  end
end