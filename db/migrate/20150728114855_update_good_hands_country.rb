class UpdateGoodHandsCountry < ActiveRecord::Migration
  def change
    remove_column :good_hands, :country
    add_column :good_hands, :country_id, :integer
  end
end
