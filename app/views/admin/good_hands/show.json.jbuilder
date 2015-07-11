json.good_hand do
  json.id                  @good_hand.id
  json.family              @good_hand.family
  json.name                @good_hand.name
  json.rkf                 @good_hand.rkf
  json.scorp               @good_hand.scorp
  json.breed_id            @good_hand.breed.try(:id)
  json.description         @good_hand.description
  json.preview_images      @good_hand.preview_images_url
  json.prize_image_url     (@good_hand.prize.exists? ? @good_hand.prize.url : nil)
  json.prize_file_name     (@good_hand.prize.exists? ? @good_hand.prize_file_name : nil)
  json.prize_file_size     (@good_hand.prize.exists? ? @good_hand.prize_file_size : nil)
  json.bloodline_image_url (@good_hand.bloodline.exists? ? @good_hand.bloodline.url : nil)
  json.bloodline_file_name (@good_hand.bloodline.exists? ? @good_hand.bloodline_file_name : nil)
  json.bloodline_file_size (@good_hand.bloodline.exists? ? @good_hand.bloodline_file_size : nil)
  json.mother_image_url    (@good_hand.mothers_photo.exists? ? @good_hand.mothers_photo.url : nil)
  json.mother_file_name    (@good_hand.mothers_photo.exists? ? @good_hand.mothers_photo_file_name : nil)
  json.mother_file_size    (@good_hand.mothers_photo.exists? ? @good_hand.mothers_photo_file_size : nil)
  json.father_image_url    (@good_hand.fathers_photo.exists? ? @good_hand.fathers_photo.url : nil)
  json.father_file_name    (@good_hand.fathers_photo.exists? ? @good_hand.fathers_photo_file_name : nil)
  json.father_image_url    (@good_hand.fathers_photo.exists? ? @good_hand.fathers_photo_file_size : nil)
  json.has_prize           @good_hand.prize.exists?
  json.age                 @good_hand.age
  json.owner               @good_hand.owner.try(:full_name)
  json.owner_phone         @good_hand.owner.try(:phone)
  json.approved            @good_hand.approved
end