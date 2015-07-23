class AddNewFieldsToCopulation < ActiveRecord::Migration
  def change
     add_column :copulations, :country, :string
     add_column :copulations, :city, :string
     add_column :copulations, :sex, :string
     add_column :copulations, :color, :string
     add_column :copulations, :weight, :string
  end
end
