class Api::ProductsController < ApplicationController
  def products_all
    @products = Product.all
    render 'productjson.jb'
  end

  def product_1
    @product_1 = Product.first
    render 'product_1json.jb'
  end

  def product_2
    @product_2 = Product.second
    render 'product_2json.jb'
  end

  def product_3
    @product_3 = Product.last
    render 'product_3json.jb'
  end

  def product_prefer
    @product_pref = params["product_preferred"]
    if
      @product_pref == "product_1"
      @product_pref = Product.first
    elsif @product_pref == "product_2"
      @product_pref = Product.second
    elsif @product_pref == "product_3"
      @product_pref = Product.third
    end
    render 'product_any.json.jb'
  end

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
