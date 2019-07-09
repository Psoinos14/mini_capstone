class Product < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :image_url, length: { maximum: 23000 }

  def supplier
    Supplier.find_by(id: supplier_id)
  end

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


end
