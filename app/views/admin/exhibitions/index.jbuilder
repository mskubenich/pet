json.exhibitions @exhibitions.each do |exhibition|
  json.id                exhibition.id
  json.title             exhibition.title_ru
  json.body              exhibition.body_ru.to_s[0..40] + '...'
  json.rkf               exhibition.rkf
  json.scorp             exhibition.scorp
  json.created_at        "#{ time_ago_in_words(exhibition.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ exhibition.created_at.strftime "%H:%M"}"
  json.preview_image_url exhibition.preview_image.url(:thumb)
end
json.count @count