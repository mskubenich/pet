json.competition do
  json.id                @competition.id
  json.title_ru          @competition.title_ru
  json.body_ru           @competition.body_ru
  json.title_en          @competition.title_en
  json.body_en           @competition.body_en
  json.rkf               @competition.rkf
  json.scorp             @competition.scorp
  json.preview_image_url @competition.preview_image.url(:thumb)
end