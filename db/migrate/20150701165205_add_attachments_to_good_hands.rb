class AddAttachmentsToGoodHands < ActiveRecord::Migration
  def change
    add_attachment :good_hands, :prize
    add_attachment :good_hands, :bloodline
    add_attachment :good_hands, :mothers_photo
    add_attachment :good_hands, :fathers_photo
  end
end