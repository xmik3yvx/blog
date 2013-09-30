
class User < ActiveRecord::Base

  has_secure_password

  before_save do
    self.email = email.downcase 
	self.username = username.downcase
  end
  
  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_many :posts
  validates :password, length: { minimum: 6}

end
