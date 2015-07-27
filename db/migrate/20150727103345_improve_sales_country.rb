class ImproveSalesCountry < ActiveRecord::Migration
  def change
    remove_column :sales, :country
    add_column :sales, :country_id, :integer
  end
end
