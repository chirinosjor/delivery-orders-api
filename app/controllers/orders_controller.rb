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
    @order = Order.create!(create_params)
    render json: @order, status: :created
  end

  private

  def create_params
    params.require(:order).permit(:order_status, :order_code, :order_name, :order_app)
  end
end