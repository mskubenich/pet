json.order do
  json.first_name @order.first_name
  json.last_name @order.last_name
  json.email @order.email
  json.phone @order.phone
  json.country @order.country
  json.city @order.city
  json.street @order.street
  json.zip @order.zip
  json.order_items @order.order_items.each do |item|
    json.price item.price
    json.count item.count
    json.title item.title
  end
  json.total_price @order.total_price
end