json.copulation do
  json.id                  @copulation.id
  json.family              @copulation.family
  json.name                @copulation.name
  json.rkf                 @copulation.rkf
  json.scorp               @copulation.scorp
  json.breed               @copulation.breed
  json.description         @copulation.description
  json.price               @copulation.price
  json.preview_images      @copulation.preview_images_url
  json.prize_image_url     (@copulation.prize.exists? ? @copulation.prize.url : nil)
  json.bloodline_image_url (@copulation.bloodline.exists? ? @copulation.bloodline.url : nil)
  json.mother_image_url    (@copulation.mothers_photo.exists? ? @copulation.mothers_photo.url : nil)
  json.father_image_url    (@copulation.fathers_photo.exists? ? @copulation.fathers_photo.url : nil)
  json.has_prize           @copulation.prize.exists?
  json.age                 @copulation.age
  json.owner               @copulation.owner.try(:full_name)
  json.owner_phone_hashed  @copulation.owner.try(:phone)[0..4].to_s + '*****'
  json.reject_reason       @copulation.reject_reason
end