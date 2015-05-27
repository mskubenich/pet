class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false, message: "has already been taken." },
            format: { with: /.*\@.*\..*/, message: "is incorrect"},
            presence: true

  attr_accessor :password, :password_confirmation
  validates :password, presence: true, confirmation: { message: "should match %{attribute}" }, length: { in: 6..20 }, if: lambda{ new_record? || !password.nil? }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :login, presence: true

  before_save :encrypt_password, :downcase_email
  after_create :set_default_role

  has_many :sessions
  has_and_belongs_to_many :roles

  def authenticate(password)
    self.encrypted_password == encrypt(password)
  end

  def admin?
    self.roles.map(&:name).include? 'admin'
  end

  def user?
    self.roles.map(&:name).include? 'user'
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  private

  def set_default_role
    self.roles << Role.user
  end

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(self.password) if self.password
  end

  def encrypt(string)
    secure_hash("#{string}--#{self.salt}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{self.password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

  def downcase_email
    self.email = email.downcase if self.email
  end
end