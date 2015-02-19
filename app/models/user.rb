require 'bcrypt'

class User < ActiveRecord::Base

  has_many :posts

  
  validates :name, presence: true, length: {minimum: 3}

  has_attached_file :avatar, :styles => { :large =>  "750x370#", :medium => "300x200>", :thumb => "100x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|png)$/
  validates_attachment_size :avatar, :less_than => 2.megabytes
  
  validates :uid, presence: true, uniqueness: true
  validates :uid, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ix }, if: "provider.nil?"
  validates :password, presence: true, confirmation: true, on: :create, if: "provider.nil?"
  validates :password_confirmation, presence:true, on: :create, if: "provider.nil?"
  
  def hash_password(secret)
    unless self.salt
      self.salt = BCrypt::Engine.generate_salt
    end
    BCrypt::Engine.hash_secret(secret, self.salt)
  end

  def self.authenticate(uid, secret)
    user = User.find_by(uid: uid)
    if user && user.check_password(secret)
      user
    else
      nil
    end
  end

  def self.authenticate_by_oauth(hash)
    @user = User.find_by(uid: hash[:uid], provider:hash[:provider])
    unless @user
      @user = User.create(uid: hash[:uid], provider:hash[:provider], name: hash[:info][:name])
    end
    @user
  end

  def password=(secret)
    write_attribute(:password,hash_password(secret))
  end
  
  def password_confirmation=(secret)
    @password_confirmation = hash_password(secret)
  end

  
  def check_password(secret)
    self.password == BCrypt::Engine.hash_secret(secret, self.salt)
  end
  

  

end
