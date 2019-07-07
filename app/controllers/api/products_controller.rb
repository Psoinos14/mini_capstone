class Api::ProductsController < ApplicationController
  
  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    elsif params[:discount]
      @products = Product.where("price < ?", "#{params[:discount]}")
    else
      @products = Product.all
    end
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
    if @product.save
      render 'show.json.jb'
    else
      render 'errors.json.jb'
    end
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    if @product.save
      render 'update.json.jb'
    else
      render 'errors.json.jb'
    end
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render 'destroy.json.jb'
  end

end
