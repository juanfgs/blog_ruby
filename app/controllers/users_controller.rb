class UsersController < ApplicationController

  def sign_up
    
  end

  def sign_up_process
    user = User.new
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.hash_password params[:user][:password]
    user.password_confirmation = BCrypt::Engine.hash_secret(params[:user][:password], user.salt)
    
    if user.save
      redirect_to '/', flash => {:notice => "Thank you for registering"}
    else
      user.errors.each do |attribute, error|
        flash[attribute] = error
      end
      redirect_to :back
    end

  end
  
  
  def login
    
  end
  
  def process_login
    
  end
  
end
