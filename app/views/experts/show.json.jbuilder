json.expert do
  json.id @expert.id
  json.profession @expert.specialist_type
  json.comments_count @expert.comments.count
  json.views_count @expert.views.count
  json.full_name @expert.full_name
  json.avatar_url @expert.avatar(:thumb)
  json.city @expert.city
  json.pets_images @expert.pets.map{|pet| pet.preview_image.file.url :thumb }
end