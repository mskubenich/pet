json.images @attachments.each do |attachment|
  @copulation = Copulation.find(attachment.entity_id)
  json.url attachment.file.url(:thumb)
  json.name @copulation.name
  json.description "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
  json.rate 3
end