class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :support, :how_it_works]


  def after_sign_in_path_for(user)
    if user.profile.nil?
      new_profile_path
    else 
      pages_user_home_path  
    end 
  end
  
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


end

