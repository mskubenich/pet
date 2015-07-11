json.good_hands @good_hands.each do |hand|
  json.id                hand.id
  json.family            hand.family
  json.name              hand.name
  json.rkf               hand.rkf
  json.scorp             hand.scorp
  json.breed_id          hand.breed.try(:id)
  json.description       hand.description.to_s[0..100] + '...'
  json.preview_image_url hand.preview_image_url
  json.has_prize         hand.prize.exists?
  json.approved          hand.approved
  json.created_at "#{ time_ago_in_words(hand.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ hand.created_at.strftime "%H:%M"}"

end
json.count @count