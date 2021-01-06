class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = Order.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
  params.require(:order).permit(:post_code, :area_id, :city, :street_number, :building_number, :phone_number).merge(user_id: current_user.id).merge(item_id: params.require(:item_id))
  end

end