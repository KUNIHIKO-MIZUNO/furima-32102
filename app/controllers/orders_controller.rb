class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item
  
  def index
    # その商品についてのインスタンスを作る記述
    # (そのアイテムのid)→params[id]だとだめなので、その商品のidとわかるように工夫
    # これから作るformオブジェクトのインスタンスを作る記述
    @pay = Pay.new
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def create
    @pay = Pay.new(order_params)
    if @pay.valid?
      pay_item
      @pay.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:pay).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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
