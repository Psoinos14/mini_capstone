Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/all_products" =>  "products#products_all"
    get "/product_1" => "products#product_1"
    get "/product_2" => 'products#product_2'
    get "/product_3" => 'products#product_3'
  end

end
