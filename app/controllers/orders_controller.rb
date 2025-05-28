class OrdersController < ApplicationController
  def index
    @order = order.new
    @item = Item.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order)
  end
end
