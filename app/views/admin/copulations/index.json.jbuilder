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
  json.approved          copulation.approved
  json.country           Country.find(copulation.country_id)
  json.country_id        copulation.country_id
  json.city              copulation.city
  json.sex               copulation.sex
  json.color             copulation.color
  json.weight            copulation.weight
end
json.count @count