class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    !!current_user
  end

end
