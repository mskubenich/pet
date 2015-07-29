json.exhibition do
  json.id                @exhibition.id
  json.title_ru          @exhibition.title_ru
  json.body_ru           @exhibition.body_ru
  json.title_en          @exhibition.title_en
  json.body_en           @exhibition.body_en
  json.rkf               @exhibition.rkf
  json.scorp             @exhibition.scorp
  json.preview_image_url @exhibition.preview_image.url(:thumb)
end