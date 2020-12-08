class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.includes(:user).order("created_at ASC")
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

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :explain, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_how_long_id, :image).merge(user_id: current_user.id)
  end
end
