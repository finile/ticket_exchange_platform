class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authenticate_active_admin_user!
   authenticate_user!
   unless current_user.has_role 'admin'
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
   end
end


end
