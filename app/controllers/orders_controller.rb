class OrdersController < ApplicationController
  
  before_action :move_to_login, only: :index
  before_action :move_to_index, only: :index
  before_action :set_item 

  def index
    @order = OrderAddresses.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddresses.new(order_params)
    if @order.valid?

      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:es][:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  private

  def order_params
    params.require(:order_addresses).permit(:post_cord, :city, :address, :building_name, :phone_number, :shipping_region_id).merge(item_id: @item.id, user_id: current_user.id)
  end

  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end

  def move_to_index 
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id 
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
