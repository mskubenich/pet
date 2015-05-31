class NewsLocalization < ActiveRecord::Migration
  def change
    remove_column :news, :body
    remove_column :news, :title
    add_column :news, :body_ru, :text
    add_column :news, :body_en, :text
    add_column :news, :title_ru, :string
    add_column :news, :title_en, :string
  end
end
