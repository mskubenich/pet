class AddEntityTypeToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :entity_type, :string
  end
end
