class OrdersController < ApplicationController
  def index
    #その商品についてのインスタンスを作る記述
    @item = Item.find(params[:item_id])  #(そのアイテムのid)→params[id]だとだめなので、その商品のidとわかるように工夫

    #これから作るformオブジェクトのインスタンスを作る記述
    @pay = Pay.new

  end

  def create
    @pay = Pay.new(order_params)  
     if @pay.valid?
      @pay.save
       redirect_to action: :index
     else
      @item = Item.find(params[:item_id])
       render action: :index
     end
  end


  private
  
  def order_params
   params.require(:pay).permit(:item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end

end
