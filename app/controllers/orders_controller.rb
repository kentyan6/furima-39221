class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new
  end

  def new
  end

  def create
    @order_information = OrderInformations.new(order_params)
    if @order_information.valid?
      @order_information.save
      redirect_to root_path
    else
      render :new
    end
  end
end


private

def order_params
  params.require(:order_information).permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: current_user.id)
end
