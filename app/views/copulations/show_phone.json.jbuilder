json.copulation do
  json.owner_phone         @copulation.owner.try(:phone)
end