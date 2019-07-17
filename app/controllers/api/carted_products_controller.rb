class Api::CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.new(
      quantity: params[:quantity],
      product_id: params[:product_id],
      status: "carted",
      user_id: current_user.id
    )
    @carted_product.save
    render "show.json.jb"
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render "index.json.jb"
  end


end
