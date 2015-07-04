json.product do
  json.id                  @product.id
  json.family              @product.family
  json.title               @product.title
  json.description         @product.description
  json.price               @product.price
  json.preview_images      @product.preview_images_url
  json.created_at "#{ time_ago_in_words(@product.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ @product.created_at.strftime "%H:%M"}"
end