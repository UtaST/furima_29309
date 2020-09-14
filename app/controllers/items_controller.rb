class ItemsController < ApplicationController
  before_action :search_item, only: [:index, :search_option]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
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
    @item = ItemTag.new(item_tag_params)
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
    binding.pry
    if @item.valid?
      @item.update(item_params)
      return redirect_to item_path
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

  def search_option
    @results = @i.result.includes(:tags)
  end

  private

  def item_tag_params
    params.require(:item_tag).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price, :tag_name).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_ragular
    if !(user_signed_in?)
      redirect_to new_user_session_path
    elsif current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def search_item
    @i = Item.ransack(params[:q])
  end

end
