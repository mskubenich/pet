class AddFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :material, :string
    add_column :products, :size, :string
    add_column :products, :weight, :string
    add_column :products, :country, :string
  end
end
