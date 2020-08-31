class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category, :condition, :shipping_charge, :prefecture, :days_until_shipping, :price).merge(user_id: current_user.id)
  end
end
