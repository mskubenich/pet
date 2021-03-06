json.copulation do
  json.id                  @copulation.id
  json.family              @copulation.family
  json.name                @copulation.name
  json.rkf                 @copulation.rkf
  json.scorp               @copulation.scorp
  json.breed_id            @copulation.breed.try(:id)
  json.breed               @copulation.breed.try("title_#{ I18n.locale }")
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
  json.owner_phone_hashed  @copulation.owner.try(:phone).to_s[0..4] + '*****'
  json.reject_reason       @copulation.reject_reason
  json.color               @copulation.color
  json.weight              @copulation.weight
  json.country_id          @copulation.country_id
  json.country             Country.find(@copulation.country_id)
  json.city                @copulation.city
  json.sex                 @copulation.sex
end