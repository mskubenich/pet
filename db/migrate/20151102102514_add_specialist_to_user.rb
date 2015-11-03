class AddSpecialistToUser < ActiveRecord::Migration
  def change
    add_column :users, :specialist, :boolean, default: false
    add_column :users, :specialist_approved, :boolean, default: false
    add_column :users, :specialist_requested, :boolean, default: false
    add_column :users, :specialist_type, :string
    add_column :users, :specialist_reject_reason, :string
  end
end
