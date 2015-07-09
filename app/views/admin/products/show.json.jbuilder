json.product do
  json.id                  @product.id
  json.family              @product.family
  json.title               @product.title
  json.description         @product.description
  json.price               @product.price
  json.subcategory_id      @product.shop_subcategory_id if @product.shop_subcategory
  json.category_id         @product.shop_subcategory.shop_category.id if @product.shop_subcategory
  json.preview_images      @product.preview_images_url
  json.created_at "#{ time_ago_in_words(@product.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ @product.created_at.strftime "%H:%M"}"
end