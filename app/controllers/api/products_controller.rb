class Api::ProductsController < ApplicationController
  #before_action :authenticate_admin, except: [:index, :show]
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    if params[:discount]
      @products = Product.where("price < ?", "#{params[:discount]}")
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
      description: params[:description],
      supplier_id: params[:supplier_id]
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
