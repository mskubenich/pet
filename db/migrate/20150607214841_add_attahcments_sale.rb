class AddAttahcmentsSale < ActiveRecord::Migration
  def change
    add_attachment :sales, :prize
    add_attachment :sales, :bloodline
    add_attachment :sales, :mothers_photo
    add_attachment :sales, :fathers_photo
  end
end
