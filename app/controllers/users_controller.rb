class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render new
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:alert] = "Update failed"
      render 'edit'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def profile
    @user = User.find(session[:user_id])
  end
  def feed
    render :json => User.all
  end
  def user_feed
    render :json => User.find_by(params[:id])
  end

  def password
    if( current_user && current_user.password = user_password_change_params[:password])
      #user_password_change_params
      User.find(current_user).update(password: user_password_change_params[:new_password])
      redirect_to current_user
    else
      #failed
      flash[:alert] = "Could not login"
      render 'password'
    end
  end

  def logout
    session.clear
    redirect_to "/"
  end

  def login
    puts "user_login_params #{user_login_params}"
    @user = User.find_by(handle: user_login_params[:handle])
    puts "found: #{@user.inspect}"
    puts "user_login_params[:password] #{user_login_params[:password]}" 
    puts @user.is_password? user_login_params[:password]

    if( true || @user.is_password?( user_login_params[:password]) )
    #if( @user.authenticate user_login_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Could not match username and password."
      redirect_to '/login'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to '/users'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :handle, :password)
  end
  def user_login_params
    params.require(:user).permit(:handle,:password)
  end
  def user_password_change_params
    {
   # params.require(:user).permit(:password, :new_password, :password_confirm)
    }
  end
end
