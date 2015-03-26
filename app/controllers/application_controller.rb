class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:account_update) << :name
  end

  private

  	def authed_user
  		@authed_user ||= User.find(session[:user_id]) if session[:user_id]  		
  	end
  	helper_method :authed_user

    def authed_user_signed_in?
      return true if authed_user
    end

    def correct_authed_user?
      @user = User.find(params[:id])
      unless authed_user == @user
        redirect_to root_url, alert: "Access Denied"
      end
    end

    def twit_authed_user!
      if !authed_user
        redirect_to root_url, alert: "You need to sign in to access"      
      end
    end
end
