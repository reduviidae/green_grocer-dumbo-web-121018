require "pry"

def consolidate_cart(cart)
  temp_item = ""
  new_cart = {}
  cart.each do |grocery_item|
    grocery_item.each do |food, about|
      # binding.pry
      about = about.merge({:count => 1})
      if food == temp_item
        about[:count] = about[:count] + 1
      end
      new_cart = new_cart.merge({food => about})
      temp_item = food
      # binding.pry
    end
    # binding.pry
  end
  new_cart
  # binding.pry
end

def apply_coupons(cart, coupons)
  # binding.pry
  discount_cart = {}
  cart.each do |item, info|
    # binding.pry
    i = 0
    while i < coupons.length
      if coupons[i][:item] == item
        binding.pry
        info[:count] = (info[:count] - coupons[i][:num])
        discount_cart = discount_cart.merge({})
      end
      i += 1
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
