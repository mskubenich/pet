class Session < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  validates :user_id, presence: true

  def generate_token
    self.token = encrypt
  end

  private

  def encrypt
    secure_hash("#{Time.now.utc - (rand(1000).hours)}--#{self.user.user_email}--#{self.user.user_salt}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end