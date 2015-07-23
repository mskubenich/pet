class AddNewFieldsToGoodHends < ActiveRecord::Migration
  def change
    add_column :good_hands, :country, :string
    add_column :good_hands, :city, :string
    add_column :good_hands, :sex, :string
    add_column :good_hands, :color, :string
    add_column :good_hands, :weight, :string
  end
end
