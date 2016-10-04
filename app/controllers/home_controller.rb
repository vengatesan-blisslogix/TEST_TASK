class HomeController < ApplicationController
before_action :authenticate_user!, only: [:add_user]
  def index
  end
  def add_user
  	@user_all = User.where("role='user'")
if params[:email] and params[:code_id].to_i!=0
	@find_email = User.find_by_email(params[:email])
	if @find_email
		redirect_to home_add_user_path,:alert => ' Email has already been taken!!!'
	else

@user = User.create(email: "#{params[:email]}",
password: "password",
password_confirmation: "password",
secret_code_id: params[:code_id],
role:'user'              
)
@user.save!
@c = SecretCode.find_by_id(params[:code_id])
@c.update_attributes(:user_id=>@user.id)
end
elsif params[:email] and params[:code_id].to_i==0
redirect_to home_add_user_path,:alert => 'Please create secret code!!!'
end

  end


  private
def authenticate_user!
if user_signed_in? and current_user.role=='admin'
super
else
redirect_to home_index_path, :alert => 'Unauthorized access!!!'
end
end
end
