json.copulations @copulations.each do |copulation|
  json.id                copulation.id
  json.family            copulation.family
  json.name              copulation.name
  json.rkf               copulation.rkf
  json.scorp             copulation.scorp
  json.breed             copulation.breed
  json.description       copulation.description.to_s[0..100] + '...'
  json.price             copulation.price
  json.preview_image_url copulation.preview_image_url
  json.has_prize         copulation.prize.exists?
end
json.count @count