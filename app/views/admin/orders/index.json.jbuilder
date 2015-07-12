json.orders @orders.each do |order|
  json.email order.email
  json.name "#{ order.first_name} #{ order.last_name }"
  json.price order.total_price
  json.phone order.phone
  json.id order.id
end
json.count @count