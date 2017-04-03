class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_filter :authenticate_user!
  
  def sign_in_user
    if params["ID"].present? and params["token"].present?
      user = User.find_by(:promotore => params["ID"])
      if user.present?
        sign_out(current_user) if current_user.present?
        user.update_attributes(:token => params["token"], :token_expire => (Time.now + 1.hour))
        flash[:notice] = 'Signed in successfully.'
        sign_in(user)
        redirect_to root_path
      else
        flash[:notice] = 'User does not exist.'
      end
    end

    if current_user.present? and current_user.token_expire < Time.now
      sign_out(current_user)
      session[:current_user] = nil
      flash[:notice] = 'Token expired.'
      redirect_to root_path
    end

  end
end
