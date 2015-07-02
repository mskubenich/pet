class CreateShopSubcategories < ActiveRecord::Migration
  def change
    create_table :shop_subcategories do |t|
      t.string :title_ru
      t.string :title_en
      t.references :shop_category
    end
    create_table :shop_subcategories_news, force: true do |t|
      t.references :product
      t.references :shop_subcategory
    end
  end
end