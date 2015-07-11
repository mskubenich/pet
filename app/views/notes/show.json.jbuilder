json.note do
  json.rating @entity.rating
  json.readonly @entity.noted(current_user) || !current_user
  json.voices_count @entity.voices_count
end