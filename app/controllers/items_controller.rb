class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_root, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.purchase.presence
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  rescue StandardError => e
    puts '削除できません'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_root
    redirect_to root_path if current_user.id != @item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :cost_id, :area_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
