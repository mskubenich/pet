json.competitions @competitions.each do |competition|
  json.id                competition.id
  json.title             competition.title_ru
  json.body              competition.body_ru.to_s[0..40] + '...'
  json.rkf               competition.rkf
  json.scorp             competition.scorp
  json.created_at        "#{ time_ago_in_words(competition.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ competition.created_at.strftime "%H:%M"}"
  json.preview_image_url competition.preview_image.url(:thumb)
end
json.count @count