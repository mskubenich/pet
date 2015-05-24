class CreateSession < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token
    end

    create_table :sessions_user do |t|
      t.integer :session_id
      t.integer :user_id
    end
  end
end