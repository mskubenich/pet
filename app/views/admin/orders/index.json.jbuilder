json.orders @orders.each do |order|
  json.email order.email
  json.name "#{ order.first_name} #{ order.last_name }"
  json.price order.total_price
end
json.count @count