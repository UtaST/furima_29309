class CardsController < ApplicationController
  def new
  end

  def create
    unless params[:purchase_address]
      flash.now[:notice] = "クレジットカード情報を正確に入力してください"
      render :new
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.create(
        description: 'test',
        card: params[:purchase_address][:token]
      )
      
      card = Card.new(
        token: params[:purchase_address][:token],
        customer_token: customer.id,
        user_id: current_user.id
      )
      if card.save
        redirect_to users_show_path
      else
        render :new
      end
    end
  end

end
