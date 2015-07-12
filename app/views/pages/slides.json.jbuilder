json.images @copulations.each do |c|
  json.url c.preview_image.file.url(:thumb)
  json.name c.name
  json.description c.preview_text_only(45) + '...'
  json.rate (c.rating*4.0)/5.0
end