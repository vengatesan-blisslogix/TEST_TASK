class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  private
#def after_sign_in_path_for(resource)
#secret_code_index_path
#end

def authenticate_user!
if user_signed_in? and current_user.role=='admin'
super
puts"--current_user.role---#{current_user.role}--------"
else
#redirect_to home_index_path, :notice => 'Not authenticate user!'
#puts"--current_user.role---#{current_user.role}--------"
end
end



end
