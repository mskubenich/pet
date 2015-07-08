class ShopSubcategory < ActiveRecord::Base
  belongs_to :shop_category

  has_many :products
end
