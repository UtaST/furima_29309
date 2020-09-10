class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :set_item_tag, only: [:edit, :update]
  before_action :move_ragular, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
    @purchases = Purchase.all
  end

  def new
    if user_signed_in?
      @item = ItemTag.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = ItemTag.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @purchases = Purchase.all
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  def destroy
    if current_user.id == @item.user_id && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"])
    render json: { keyword: tag }
  end

  private

  def item_params
    params.require(:item_tag).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :tag_name).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_tag
    @item = ItemTag.find(params[:id])
  end

  def move_ragular
    if !(user_signed_in?)
      redirect_to new_user_session_path
    elsif current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
