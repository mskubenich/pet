json.experts @experts do |expert|
  json.id expert.id
  json.profession expert.specialist_type
  json.comments_count expert.comments.count
  json.views_count expert.views.count
  json.full_name expert.full_name
  json.preview_image_url expert.avatar(:medium)
  json.city expert.city
end