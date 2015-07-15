json.product do
  json.id @product.id
  json.preview_images @product.preview_images_url
  json.title @product.title
  json.description @product.description
  json.price @product.price
  json.family @product.family
  json.material @product.material
  json.size @product.size
  json.weight @product.weight
  json.country @product.country
  json.created_at @product.created_at
  json.shop_subcategory_id @product.shop_subcategory_id
  json.description @product.description
  json.type "#{ @product.shop_subcategory.try(:shop_category) ? @product.shop_subcategory.try(:shop_category).try("title_#{ I18n.locale }") : I18n.t('menu.products') } #{ @product.shop_subcategory.try("title_#{ I18n.locale }") } #{ @product.family == 'cat' ? I18n.t('shop.for_cats') : '' } #{ @product.family == 'dog' ? I18n.t('shop.for_dogs') : '' }"
end