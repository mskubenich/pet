class AddRejectReasonToSales < ActiveRecord::Migration
  def change
    add_column :sales, :reject_reason, :text
    add_column :copulations, :reject_reason, :text
  end
end
