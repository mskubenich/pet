json.main_slides @main_slides.each do |slide|
  json.image_url slide.image.url(:thumb)
  json.id slide.id
end
json.count @count