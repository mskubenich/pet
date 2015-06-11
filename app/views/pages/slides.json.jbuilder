json.images @attachments.each do |attachment|
  json.url attachment.file.url(:thumb)
  json.text 'test'
end