class UsersController < ApplicationController

  def sign_up
    
  end

  def sign_up_process
    
    authhash = request.env['omniauth.auth']
    user = User.new

    unless authhash
      user.name = params[:user][:name]
      user.uid = params[:user][:email]
      user.password = params[:user][:password]
      user.password_confirmation = BCrypt::Engine.hash_secret(params[:user][:password_confirmation], user.salt)
    else
      if login_user = User.find_by(uid: authhash[:uid], provider: authhash[:provider])  #The user is already registered, this should be moved to login_process somehow
        session[:user_id] = login_user.id
        redirect_to '/admin/', flash: { notice: sprintf("Welcome %s",login_user.name)}
        return
      end
      user.provider = authhash[:provider]      
      user.name = authhash[:info][:name]
      user.uid = authhash[:uid]
    end

    if user.save
        redirect_to '/', flash: {notice: "Thank you for registering"}
    else
      user.errors.each do |attribute, error|
        flash[attribute] = error
      end
      redirect_to '/'
    end
  end


  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  
  def login
    if session[:user_id]
      redirect_to :back
    end
  end
  
  def login_process
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/admin/', flash: { notice: sprintf("Welcome %s",user.name)}
    else
      redirect_to :back, flash: {error: "Incorrect User/Password combination"}
    end
    
  end

  def index
    @users = User.all.page params[:page]
  end
  def show
    @user = User.find(params[:id])
  end



  
end
