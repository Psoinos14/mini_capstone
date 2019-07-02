class Api::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    @product.save
    render 'show.json.jb'
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    @product.save
    render 'update.json.jb'
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render 'destroy.json.jb'
  end

end
