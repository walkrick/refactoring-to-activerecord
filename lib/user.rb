require "active_record"

class User <ActiveRecord::Base
  has_many :fishes


  validates :username, :presence => {:message => "Username is required"}
  validates :username, :uniqueness => {:message => "Username has already been taken"}

  validates :password, :presence => {:message => "Password is required"}
  validates :password, :length => {:minimum => 4, :message => "Password must be at least 4 characters"}


end
# def validate_registration_params
#   if params[:username] != "" && params[:password].length > 3 && username_available?(params[:username])
#     return true
#   end
#
#   error_messages = []
#
#   if params[:username] == ""
#     error_messages.push("Username is required")
#   end
#
#   if !username_available?(params[:username])
#     error_messages.push("Username has already been taken")
#   end
#
#   if params[:password] == ""
#     error_messages.push("Password is required")
#   elsif params[:password].length < 4
#     error_messages.push("Password must be at least 4 characters")
#   end
#
#   flash[:notice] = error_messages.join(", ")
#
#   false
#end