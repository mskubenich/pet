json.copulation do
  json.price               @copulation.price
  json.id                  @copulation.id
  json.family              @copulation.family
  json.name                @copulation.name
  json.rkf                 @copulation.rkf
  json.scorp               @copulation.scorp
  json.breed_id            @copulation.breed.try(:id)
  json.description         @copulation.description
  json.preview_images      @copulation.preview_images_url
  json.prize_image_url     (@copulation.prize.exists? ? @copulation.prize.url : nil)
  json.prize_file_name     (@copulation.prize.exists? ? @copulation.prize_file_name : nil)
  json.prize_file_size     (@copulation.prize.exists? ? @copulation.prize_file_size : nil)
  json.bloodline_image_url (@copulation.bloodline.exists? ? @copulation.bloodline.url : nil)
  json.bloodline_file_name (@copulation.bloodline.exists? ? @copulation.bloodline_file_name : nil)
  json.bloodline_file_size (@copulation.bloodline.exists? ? @copulation.bloodline_file_size : nil)
  json.mother_image_url    (@copulation.mothers_photo.exists? ? @copulation.mothers_photo.url : nil)
  json.mother_file_name    (@copulation.mothers_photo.exists? ? @copulation.mothers_photo_file_name : nil)
  json.mother_file_size    (@copulation.mothers_photo.exists? ? @copulation.mothers_photo_file_size : nil)
  json.father_image_url    (@copulation.fathers_photo.exists? ? @copulation.fathers_photo.url : nil)
  json.father_file_name    (@copulation.fathers_photo.exists? ? @copulation.fathers_photo_file_name : nil)
  json.father_image_url    (@copulation.fathers_photo.exists? ? @copulation.fathers_photo_file_size : nil)
  json.has_prize           @copulation.prize.exists?
  json.age                 @copulation.age
  json.owner               @copulation.owner.try(:full_name)
  json.owner_phone         @copulation.owner.try(:phone)
  json.approved            @copulation.approved
  json.country             @copulation.country
  json.city                @copulation.city
  json.sex                 @copulation.sex
  json.color               @copulation.color
  json.weight              @copulation.weight
end