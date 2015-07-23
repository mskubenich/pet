class AddNewFieldsToSels < ActiveRecord::Migration
  def change
    add_column :sales, :country, :string
    add_column :sales, :city, :string
    add_column :sales, :sex, :string
    add_column :sales, :color, :string
    add_column :sales, :weight, :string
  end
end
