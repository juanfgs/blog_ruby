require 'bcrypt'

class User < ActiveRecord::Base

  validates :name, presence: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence:true

  def hash_password(secret)
    self.salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(secret, self.salt)
  end


  def authenticate(email, secret)
    user = User.where(email: email).first
    if user && user.check_password (secret)
      user
    end
    nil
  end
  
  def check_password(secret)
    self.password == BCrypt::Engine.hash_secret(secret, self.salt)
  end
  
  
end
