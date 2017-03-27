class User < ApplicationRecord
  before_save :hash_password
  has_many :activities , through:  :subscribes
  validates :username, :password, :presence => true
  VAILD_EMAIL_REGEX = /\A[\w+\-,]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, :presence => true, format: {with: VAILD_EMAIL_REGEX, message: "please enter email address",}
  validates :username, :email,  :uniqueness => true
  validates :password, :length => { :minimum => 8, maximum: 16}
  validates :username, :length => { :minimum => 4, maximum: 10}

  def hash_password
    self.salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password, salt)
  end

end
