require "pry"

def consolidate_cart(cart)
  temp_item = ""
  new_cart = {}
  cart.each do |grocery_item|
    grocery_item = grocery_item.merge({:count => 1})
    binding.pry
  end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
