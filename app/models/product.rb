class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  #validates :image_url, length: { maximum: 23000 }


  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    "$#{price.to_i * 0.09}"
  end

  def total
    "#{price.to_i + tax.to_i}"
  end

  def image_url
    if images.length > 0
      return images[0].url
    else
      return 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTLn8Q3_pJ0v0JivyKxvomI7IO-dnQZuJq3d7afXpAXa-ZTgYNaTPLdbmziHuhacVVIsrf-sj2NCL3LOB5r8RMVN0a9_5P0RAxDkX9P2LxZrLilc6WcgWhgew&usqp=CAc'
    end
  end


end
