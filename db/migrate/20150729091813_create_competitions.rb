class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.boolean  :rkf
      t.boolean  :scorp
      t.integer  :user_id
      t.text     :body_ru
      t.text     :body_en
      t.string   :title_ru
      t.string   :title_en
      t.integer  :views_count
      t.timestamps
    end
  end
end


