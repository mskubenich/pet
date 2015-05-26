class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :rkf, :boolean, default: false
    add_column :users, :scorp, :boolean, default: false
  end
end
