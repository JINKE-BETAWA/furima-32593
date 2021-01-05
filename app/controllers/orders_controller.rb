class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

 def order_params
  params.require(:order).permit(:post_code, :area_id, :city, :street_number, :building_number, :phone_number, :user_id, :item_id)
 end

end