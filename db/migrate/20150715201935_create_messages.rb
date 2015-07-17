class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :author
      t.references :user
      t.text :text
      t.text :author_name
      t.timestamps null: false
    end
  end
end
