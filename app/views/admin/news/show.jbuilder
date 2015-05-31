json.news do
  json.id                @news.id
  json.title_ru          @news.title_ru
  json.body_ru           @news.body_ru
  json.title_en          @news.title_en
  json.body_en           @news.body_en
  json.rkf               @news.rkf
  json.scorp             @news.scorp
  json.preview_image_url @news.preview_image.url(:thumb)
end