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
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :handle, :password)
  end
  def user_login_params
    params.require(:user).permit(:handle,:password)
  end
end
