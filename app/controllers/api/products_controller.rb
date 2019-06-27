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
end
