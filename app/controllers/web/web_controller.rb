class Web::WebController < ApplicationController
  skip_before_action :restrict_access
  before_action :authenticate_user!

  protected

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    current_user || redirect_to(signup_path)
  end
end
