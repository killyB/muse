#  def create
#    @user = User.where(uid: auth_hash[:uid], provider: auth_hash[:provider]).first_or_create
#   self.current_user = @user
#   redirect_to '/'
# end
#
#
#
#
class SessionsController < ApplicationController



  def create
    user = User.from_omniauth(env["omniauth.auth"]) ## Setting "user" here
    session[:user_id] = user.id  ## Changed this to use the set "user"
    redirect_to root_url
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end