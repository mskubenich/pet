class ShopCategory < ActiveRecord::Base
  has_many :shop_subcategories
end
