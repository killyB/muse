class AuthenticationsController < ApplicationController
#  before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = Authentication.all
  end


  # GET /authentications/new
  def new
    @authentication = Authentication.new
  end


  # POST /authentications
  # POST /authentications.json
  def create
    auth = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = auth.id
    redirect_to root_url, notice: "Signed In!"
    
  end


  def destroy
    session[:user_id] = nil
    cookies.delete(:remember_token)
    redirect_to root_url, notice: "Signed Out Successfully!"
    
  end

  private
    #--Had to comment out the set & before_action calls to get Twitter siqn out to work.
    # Use callbacks to share common setup or constraints between actions.
    #def set_authentication
    #  @authentication = Authentication.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :uid)
    end
end
