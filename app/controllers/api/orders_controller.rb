class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create

    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = params[:quantity].to_i * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      user_id: current_user.id,
      product_id: params[:product_id],
    )
    @order.save
    

    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    

    render 'show.json.jb'
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end

end