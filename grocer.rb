require "pry"

def consolidate_cart(cart)
  # binding.pry
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
  cart = new_cart
  cart
  # binding.pry
end

# earlier solution for reference
=begin
    i = 0
    while i < coupons.length
      if coupons[i][:item] == item
        # binding.pry
        info[:count] = (info[:count] - coupons[i][:num])
        cart = cart.merge({"#{coupons[i][:item]} W/COUPON" => {
          :price => coupons[i][:cost], 
          :clearance => cart[coupons[i][:item]][:clearance], 
          :count =>coupons[i][:num]}})
      end
      i += 1
    end
=end


def apply_coupons(cart, coupons)
  # binding.pry
  discount_cart = {}
  cart.each do |item, info|
    # binding.pry
    coupons.each do |coupon|
      # binding.pry
      if coupon[:item] == item
        cart = cart.merge({"#{item} W/COUPON" => {
          :price => coupon[:cost], 
          :clearance => info[:clearance], 
          :count => 1}})
      end
      info[:count] = (coupon[:num] - info[:count])
      # binding.pry
    end
  end
  # binding.pry
  cart
end

def apply_clearance(cart)
  # binding.pry
  cart.each do |item, info|
    # binding.pry
    if cart[item][:clearance] == true
      cart[item][:price] = (cart[item][:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # binding.pry
  consolidate_cart(cart)
  apply_coupons(cart, coupons)
  apply_clearance(cart)
  total_price = 0
  cart.each do |item, info|
      total_price += info[:price]
  end
  if total_price >= 100
    total_price = (total_price * 0.9).round(2)
  end
end