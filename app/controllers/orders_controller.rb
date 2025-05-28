class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:zipcode, :prefecture, :city, :street, :building, :tel_phone, :user_id, :item_id).merge(user_id: current_user.id) # .merge(token)
  end

  def address_params
    params.permit(:zipcode, :prefecture, :city, :street, :building, :tel_number).merge(order_id: @order.id)
  end
end
