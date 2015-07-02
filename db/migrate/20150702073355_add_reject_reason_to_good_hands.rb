class AddRejectReasonToGoodHands < ActiveRecord::Migration
  def change
    add_column :good_hands, :reject_reason, :text
  end
end
