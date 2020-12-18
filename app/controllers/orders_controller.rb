class OrdersController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # GET /orders
  def index
    @orders = Order.all
    render json: @orders, status: :ok
  end

  def create
    @order = Order.create!(order_params)
    render json: @order, status: :created
  end

  def update
    @order = Order.find(params[:id]) 
    if @order.update(order_params) 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  def show 
    render json: Order.find(params[:id]) 
  end 

  def destroy
    @order = Order.where(id: params[:id]).first
    if @order.destroy
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end

  private

  def order_params
    params.require(:order).permit(:order_status, :order_code, :order_name, :order_app)
  end

end