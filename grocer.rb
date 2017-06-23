require 'pry'

# [
#   {"AVOCADO"=>
      # {:price=>3.0, :clearance=>true}},
#    {"AVOCADO"=>
      # {:price=>3.0, :clearance=>true}},
#    {"KALE"=>
      # {:price=>3.0, :clearance=>false}}
# ]


def consolidate_cart(cart)
  # adds a count of one to each item when there are no duplicates
  # Grocer #consolidate_cart increments count when there are multiple items
  new_cart = {}
  cart.each do |item|
    grocery = item.keys.first
    if new_cart.keys.include? grocery
      new_cart[grocery][:count] += 1
    else
      new_cart[grocery] = item.values.first
      new_cart[grocery][:count] = 1
    end
  end
  new_cart
end



def apply_coupons(cart, coupons)
  new_cart = {}
  coupons.each do |coupon|
    cart.each do |item, values|
      if coupon[:item] == item
        coupon_item_count = values[:count] / coupon[:num]
        new_item_count = values[:count] % coupon[:num]
        new_cart["#{item} W/COUPON"] = {:price => coupon[:cost],
                                    :clearance => values[:clearance],
                                    :count => coupon_item_count}
        if new_item_count != 0
          new_cart[item] = {:price => values[:price],
                            :clearance => values[:clearance],
                            :count => new_item_count}
        end
      else
        new_cart[item] = values
      end
    end
  end
  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
