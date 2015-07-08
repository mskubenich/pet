class CreateShopSubcategoriesProducts < ActiveRecord::Migration
  def change
    add_column :products, :shop_subcategory_id, :integer
  end
end
