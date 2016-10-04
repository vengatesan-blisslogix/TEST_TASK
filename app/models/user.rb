class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
belongs_to :secret_code
validates :secret_code_id, presence: true
validates :secret_code_id, uniqueness: true
validates :email, uniqueness: true

end
