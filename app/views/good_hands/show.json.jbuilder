json.good_hand do
  json.id                  @good_hand.id
  json.family              @good_hand.family
  json.name                @good_hand.name
  json.rkf                 @good_hand.rkf
  json.scorp               @good_hand.scorp
  json.breed               @good_hand.breed
  json.description         @good_hand.description
  json.preview_images      @good_hand.preview_images_url
  json.prize_image_url     (@good_hand.prize.exists? ? @good_hand.prize.url : nil)
  json.bloodline_image_url (@good_hand.bloodline.exists? ? @good_hand.bloodline.url : nil)
  json.mother_image_url    (@good_hand.mothers_photo.exists? ? @good_hand.mothers_photo.url : nil)
  json.father_image_url    (@good_hand.fathers_photo.exists? ? @good_hand.fathers_photo.url : nil)
  json.has_prize           @good_hand.prize.exists?
  json.age                 @good_hand.age
  json.owner               @good_hand.owner.try(:full_name)
  json.owner_phone_hashed  @good_hand.owner.try(:phone).to_s[0..4] + '*****'
  json.reject_reason       @good_hand.reject_reason
end