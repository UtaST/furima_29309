class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_purchases, only: [:index]
  before_action :move_ragular, only: [:index]

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    redirect_to new_card_path and return unless current_user.card.present?
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_purchases
    @purchases = Purchase.all
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_ragular
    if !(user_signed_in?)
      redirect_to new_user_session_path
    elsif current_user.id == @item.user_id || @purchases.exists?(item_id: @item.id)
      redirect_to root_path
    end

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
    )
  end
end
