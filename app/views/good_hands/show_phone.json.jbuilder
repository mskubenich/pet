json.good_hand do
  json.owner_phone         @good_hand.owner.try(:phone)
end