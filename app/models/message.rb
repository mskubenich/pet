class Message < ActiveRecord::Base
  validates_presence_of :user_id, :author_id, :text
  belongs_to :author, class_name: User, foreign_key: :author_id
  belongs_to :user
end
