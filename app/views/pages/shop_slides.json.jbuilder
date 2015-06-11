json.slides 20.times do |i|
  json.image_url asset_path("shop#{ rand(2) + 1 }.png")
  json.description 'lorem ipsum dolor'
  json.price rand(10000)
end