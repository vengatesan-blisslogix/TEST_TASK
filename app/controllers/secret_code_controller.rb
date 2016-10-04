class SecretCodeController < ApplicationController
before_action :authenticate_user!
def index
	@code = SecretCode.all
end
def add
	params[:no_of_code].to_i.times do |no|
		@code = SecureRandom.hex(3)
		SecretCode.create(code: "#{@code}", user_id: 0,created_by:current_user.id)
    end
redirect_to secret_code_index_path
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
