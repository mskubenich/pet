json.news do
  json.id                @news.id
  json.title             @news.title
  json.body              @news.body[0..40] + '...'
  json.rkf               @news.rkf
  json.scorp             @news.scorp
  json.preview_image_url @news.preview_image.url
end