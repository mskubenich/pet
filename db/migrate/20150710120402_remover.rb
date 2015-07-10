class Remover < ActiveRecord::Migration
  def change
    remove_column :sales, :breed
    remove_column :copulations, :breed
    remove_column :good_hands, :breed
  end
end
