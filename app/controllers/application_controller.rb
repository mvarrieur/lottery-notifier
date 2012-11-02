class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_superuser!
    authenticate_user! 
    unless current_user.superuser?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path 
    end
  end
end
