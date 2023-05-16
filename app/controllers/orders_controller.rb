class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
       @order_information.save
       redirect_to root_path
    else
      render :index
    end
  end

end


private

def order_params
  params.require(:order_information).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
end
