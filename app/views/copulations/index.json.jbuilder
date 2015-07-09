json.copulations @copulations.each do |copulation|
  json.id                copulation.id
  json.family            copulation.family
  json.name              copulation.name
  json.rkf               copulation.rkf
  json.scorp             copulation.scorp
  json.breed             copulation.breed
  json.description       copulation.preview_text
  json.price             copulation.price
  json.preview_image_url copulation.preview_image_url
  json.has_prize         copulation.prize.exists?
  json.approved          copulation.approved
  json.comments_count    copulation.comments.count
end
json.count @count