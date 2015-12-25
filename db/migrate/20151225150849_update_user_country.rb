class UpdateUserCountry < ActiveRecord::Migration
  def change
    remove_column :users, :country, :string
    add_column :users, :country_id, :integer
  end
end
