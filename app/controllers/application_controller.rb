class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  def test_user
    User.find(logged_in?)
  end

  def logged_in?
    session[:user_id]
  end

  def my_authorize
    if !test_user.admin
      flash[:alert] = "You do not have access to this resource"
      redirect_to '/'
    end
  end

end
