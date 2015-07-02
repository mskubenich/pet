class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.string :title_ru
      t.string :title_en
    end
    create_table :shop_categories_news, force: true do |t|
      t.references :product
      t.references :shop_category
    end
  end
end