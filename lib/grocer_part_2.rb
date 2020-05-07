require_relative './part_1_solution.rb'


def apply_coupons(cart, coupons)
  cart.each do |each_item_hash|
    coupons.each do |each_coupon_hash|
      if each_item_hash[:item] == each_coupon_hash[:item] && each_item_hash[:count] >= each_coupon_hash[:num]
        
        each_item_hash[:price] = each_coupon_hash[:cost] / each_coupon_hash[:number]
        
        each_item_hash[:item] = "#{each_item_hash[:item]} W/COUPON"
        
        cart << each_item_hash
      end
        
        if each_item_hash[:item] = "#{each_coupon_hash[:item]} W/COUPON"
          
          each_item_hash[:count] += each_coupon_hash[:num]
        end
      
    end
  end
cart
end


def apply_clearance(cart)
  cart.each do |each_item_hash|
    #can also just write "if each_item_hash[:clearance]"
    if each_item_hash[:clearance] == true 
      each_item_hash[:price] = (each_item_hash[:price] - each_item_hash[:price] * 0.2)
    end
  end
end


def checkout(cart, coupons)
  
  
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  
  consolidated_cart = consolidate_cart(cart)
  consolidated_coupons_applied = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(consolidated_coupons_applied)
  
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  
  final_cart.each do |each_item_hash|
  total += each_item_hash[:price] * each_item_hash[:count]
  end
  
    if total > 100
      total = total - (total * 0.1)
    end
  total 
end
