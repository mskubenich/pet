json.announcements @good_hands.each do |hand|
  json.id                hand.id
  json.family            hand.family
  json.name              hand.name
  json.rkf               hand.rkf
  json.scorp             hand.scorp
  json.breed             hand.breed
  json.description       hand.preview_text
  json.preview_image_url hand.preview_image_url
  json.has_prize         hand.prize.exists?
  json.approved          hand.approved
  json.comments_count    hand.comments.count
end
json.count @count