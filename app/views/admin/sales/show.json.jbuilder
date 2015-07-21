json.sale do
  json.price               @sale.price
  json.id                  @sale.id
  json.family              @sale.family
  json.name                @sale.name
  json.rkf                 @sale.rkf
  json.scorp               @sale.scorp
  json.breed_id            @sale.breed.try(:id)
  json.description         @sale.description
  json.preview_images      @sale.preview_images_url
  json.prize_image_url     (@sale.prize.exists? ? @sale.prize.url : nil)
  json.prize_file_name     (@sale.prize.exists? ? @sale.prize_file_name : nil)
  json.prize_file_size     (@sale.prize.exists? ? @sale.prize_file_size : nil)
  json.bloodline_image_url (@sale.bloodline.exists? ? @sale.bloodline.url : nil)
  json.bloodline_file_name (@sale.bloodline.exists? ? @sale.bloodline_file_name : nil)
  json.bloodline_file_size (@sale.bloodline.exists? ? @sale.bloodline_file_size : nil)
  json.mother_image_url    (@sale.mothers_photo.exists? ? @sale.mothers_photo.url : nil)
  json.mother_file_name    (@sale.mothers_photo.exists? ? @sale.mothers_photo_file_name : nil)
  json.mother_file_size    (@sale.mothers_photo.exists? ? @sale.mothers_photo_file_size : nil)
  json.father_image_url    (@sale.fathers_photo.exists? ? @sale.fathers_photo.url : nil)
  json.father_file_name    (@sale.fathers_photo.exists? ? @sale.fathers_photo_file_name : nil)
  json.father_image_url    (@sale.fathers_photo.exists? ? @sale.fathers_photo_file_size : nil)
  json.has_prize           @sale.prize.exists?
  json.age                 @sale.age
  json.owner               @sale.owner.try(:full_name)
  json.owner_phone         @sale.owner.try(:phone)
  json.approved            @sale.approved
end
