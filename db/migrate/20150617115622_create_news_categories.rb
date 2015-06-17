class CreateNewsCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title_ru
      t.string :title_en
    end
    create_table :categories_news, force: true do |t|
      t.references :news
      t.references :category
    end
  end
end
