class ImproveModelUser < ActiveRecord::Migration
  def change
    remove_column :users, :rkf
    remove_column :users, :scorp
    add_column :users, :user_profession, :string
  end
end
