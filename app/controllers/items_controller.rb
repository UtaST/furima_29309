class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @purchases = Purchase.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @purchases = Purchase.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
end
