class ApplicationController < ActionController::Base

  @@whatever = "happy!"

  helper_method :whatever

  def whatever
    @@whatever
  end

  helper_method :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :set_current_user

  # def set_current_user
  #   User.current_user = current_user
  #end
end
