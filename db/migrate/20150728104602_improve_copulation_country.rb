class ImproveCopulationCountry < ActiveRecord::Migration
  def change
    remove_column :copulations, :country
    add_column :copulations, :country_id, :integer
  end
end
