json.sale do
  json.owner_phone         @sale.owner.try(:phone)
end