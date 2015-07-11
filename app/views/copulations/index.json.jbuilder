json.copulations @copulations.each do |copulation|
  json.id                copulation.id
  json.family            copulation.family
  json.name              copulation.name
  json.rkf               copulation.rkf
  json.scorp             copulation.scorp
  json.breed             copulation.breed.try("title_#{ I18n.locale }")
  json.description       copulation.preview_text
  json.price             copulation.price
  json.preview_image_url copulation.preview_image_url
  json.has_prize         copulation.prize.exists?
  json.approved          copulation.approved
  json.comments_count    copulation.comments.count
  json.views_count       copulation.views.count
end
json.count @count