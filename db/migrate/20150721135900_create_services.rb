class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :user
      t.string :provider
      t.string :uid
      t.string :uname
      t.string :uimage
    end
  end
end
