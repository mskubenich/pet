class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.string :title_ru
      t.string :title_en
    end
  end
end