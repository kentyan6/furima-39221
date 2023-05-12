class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer_information = BuyerInformation.new
  end

  def create
  end
end
