class User < ActiveRecord::Base

  include Commentable
  include Viewable
  include Ratingable


  validates :email, uniqueness: { case_sensitive: false, message: "has already been taken." },
            format: { with: /.*\@.*\..*/, message: "is incorrect"},
            presence: true, if: lambda{ !service }

  attr_accessor :password, :password_confirmation
  validates :password, presence: true, confirmation: { message: "should match %{attribute}" }, length: { in: 6..20 }, if: lambda{ (new_record? || !password.nil?) && !service }
  validates :first_name, presence: true,                   if: lambda{ !service }
  validates :last_name, presence: true,                    if: lambda{ !service }
  validates :login, presence: true,                        if: lambda{ !service }
  validates :country_id, presence: true,                   if: lambda{ !service }
  validates :city, presence: true,                         if: lambda{ !service }

  before_save :encrypt_password, :downcase_email
  after_create :set_default_role

  has_many :sessions
  has_many :posts
  has_and_belongs_to_many :roles

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :comments, foreign_key: :author_id
  has_many :friendships
  has_many :friends, -> (){ where(friendships: { status: :accepted}) },
           :through => :friendships
  has_many :requested_friends, -> (){ where(friendships: { status: :requested}) },
           :through => :friendships,
           :source => :friend
  has_many :pending_friends, -> (){ where(friendships: { status: :pending}) },
           :through => :friendships,
           :source => :friend

  has_many :incoming_messages, class_name: Message, foreign_key: :user_id
  has_many :outcoming_messages, class_name: Message, foreign_key: :author_id
  has_many :pets, class_name: MyPet

  has_one :service, dependent: :destroy

  after_create :send_welcome_email

  def friendship_status(user)
    friendship = friendships.where(friend_id: user.id).try(:first)
    if friendship
      friendship.status
    else
      'none'
    end
  end

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
    "#{ first_name.capitalize } #{ last_name.capitalize }"
  end

  def cart
    Cart.where(user_id: self.id).first_or_create
  end

  def country
    Country.find self.country_id
  end

  private

  def send_welcome_email
    WelcomeMailer.welcome_email(self).deliver_now if self.email
  end

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