require "pry"

def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item| 
    item.each do |food, info|     
      if consolidated_cart[food]
      consolidated_cart[food][:count] += 1
      else 
         consolidated_cart[food] = info 
          consolidated_cart[food][:count] = 1 
      end
    end
  end
cart = consolidated_cart


#  # binding.pry
#  temp_item = ""
#  new_cart = {}
#  cart.each do |grocery_item|
#    grocery_item.each do |food, about|
#      # binding.pry
#      about = about.merge({:count => 1})
#      if food == temp_item
#        about[:count] = about[:count] + 1
#      end
#      new_cart = new_cart.merge({food => about})
#      temp_item = food
#      # binding.pry
#    end
#    # binding.pry
#  end
#  cart = new_cart
#  cart
#  # binding.pry
end

# if there is more than one, then increment the count. 


def apply_coupons(cart, coupons)
coupons.each do |coupon|
  name = coupon[:item]
  if cart[name] && coupon[:num] <= cart[name][:count]
    if cart["#{name} W/COUPON"]
      cart["#{name} W/COUPON"][:count] += 1
    else       
      cart["#{name} W/COUPON"] = {count: 1, price: coupon[:cost], clearance: cart[name][:clearance]}    
    end    
    cart[name][:count] -= coupon[:num]
  end
end
cart
end

def apply_clearance(cart)
  # binding.pry
  cart.each do |item, info|
    # binding.pry
    if cart[item][:clearance] == true
      cart[item][:price] = (cart[item][:price] * 0.8).round(2)
    end
  cart
  end
end

def checkout(cart, coupons)
  # binding.pry
  consolidate_cart(cart)
  apply_coupons(cart, coupons)
  apply_clearance(cart)
  total_price = 0
  cart.each do |item, info|
      total_price += (info[:price] * info[:count])
  end
  if total_price >= 100
    total_price = (total_price * 0.9).round(2)
  end
end