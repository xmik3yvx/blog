
class User < ActiveRecord::Base

  before_create :create_remember_token
  has_secure_password
  has_many :posts, dependent: :destroy
  before_save do
    self.email = email.downcase 
	  self.username = username.downcase
  end
  
  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_many :posts
  validates :password, length: { minimum: 6}

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
