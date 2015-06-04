class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.text :body_ru
      t.text :body_en
      t.string :name
    end
  end
end
