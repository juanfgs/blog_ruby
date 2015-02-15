class UsersController < ApplicationController

  def sign_up
    
  end

  def process_oauth
    authhash = request.env['omniauth.auth']
    
    user = User.authenticate_by_oauth(authhash)
    session[:user_id] = user.id
    redirect_to '/admin/', flash: { notice: sprintf("Welcome %s",user.name)}

  end
  
  def sign_up_process
    user = User.new
    user.name = params[:user][:name]
    user.uid = params[:user][:email]
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    
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
