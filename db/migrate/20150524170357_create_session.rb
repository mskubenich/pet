class CreateSession < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token
      t.integer :user_id
    end
  end
end