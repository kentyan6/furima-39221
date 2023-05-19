class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :prevents_url, only: [:create]

  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      pay_item
       @order_information.save
       redirect_to root_path
    else
      render :index
    end
  end

end


private

def order_params
  params.require(:order_information).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
end

def prevents_url
  @item = Item.find(params[:item_id])
  if @item.user_id != current_user.id
    redirect_to root_path
  end
end