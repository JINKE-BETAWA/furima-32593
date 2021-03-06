class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @item_order = Order.new
    if current_user == @item.user or @item.purchase.presence
      redirect_to root_path
    end
  end

  def create
    @item_order = Order.new(order_params)
    if @item_order.valid?
      @item_order.save
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :area_id, :city, :street_number, :building_number,
                                  :phone_number).merge(user_id: current_user.id).merge(item_id: params.require(:item_id)).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
