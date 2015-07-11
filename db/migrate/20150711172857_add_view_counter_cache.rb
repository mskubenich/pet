class AddViewCounterCache < ActiveRecord::Migration
  def change
    add_column :sales, :views_count, :integer, :default => 0
    add_column :copulations, :views_count, :integer, :default => 0
    add_column :good_hands, :views_count, :integer, :default => 0
    add_column :products, :views_count, :integer, :default => 0
    add_column :news, :views_count, :integer, :default => 0
  end
end
