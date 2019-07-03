class Product < ApplicationRecord

  def is_discounted?
    if price < 10
      return true
    else
      false
    end
  end

  def tax
    "$#{price.to_i * 0.09}"
  end

  def total
    "#{price.to_i + tax.to_i}"
  end

end
