require_relative './part_1_solution.rb'


def apply_coupons(cart, coupons)
  coupons.each do |each_coupon_hash|
    cart_item = find_item_by_name_in_collection(each_coupon_hash[:item],cart)
    couponed_item_name = "#{each_coupon_hash[:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name,cart)
    
      if cart_item && cart_item[:count] >= each_coupon_hash[:num]
        
        if cart_item_with_coupon
          cart_item_with_coupon[:count] += each_coupon_hash[:num]
          cart_item[:count] -= each_coupon_hash[:num]
        else
          cart_item_with_coupon = {
            :item => couponed_item_name,
            :price => each_coupon_hash[:cost] / each_coupon_hash[:num],
            :count => each_coupon_hash[:num],
            :clearance => cart_item[:clearance]
          }
          cart << cart_item_with_coupon
          cart_item[:count] -= each_coupon_hash[:num]
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
  consolidated_cart = consolidate_cart(cart)
  consolidated_coupons_applied = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(consolidated_coupons_applied)
  total = 0
  
  final_cart.each do |each_item_hash|
  total += each_item_hash[:price] * each_item_hash[:count]
  end
  
    if total > 100
      total = total - (total * 0.1)
    end
  total 
end
