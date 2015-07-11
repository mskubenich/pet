json.sale do
  json.id                  @sale.id
  json.family              @sale.family
  json.name                @sale.name
  json.rkf                 @sale.rkf
  json.scorp               @sale.scorp
  json.breed               @sale.breed.try("title_#{ I18n.locale }")
  json.description         @sale.description
  json.price               @sale.price
  json.preview_images      @sale.preview_images_url
  json.prize_image_url     (@sale.prize.exists? ? @sale.prize.url : nil)
  json.bloodline_image_url (@sale.bloodline.exists? ? @sale.bloodline.url : nil)
  json.mother_image_url    (@sale.mothers_photo.exists? ? @sale.mothers_photo.url : nil)
  json.father_image_url    (@sale.fathers_photo.exists? ? @sale.fathers_photo.url : nil)
  json.has_prize           @sale.prize.exists?
  json.age                 @sale.age
  json.owner               @sale.owner.try(:full_name)
  json.owner_phone_hashed  @sale.owner.try(:phone).to_s[0..4] + '*****'
  json.reject_reason       @sale.reject_reason
end