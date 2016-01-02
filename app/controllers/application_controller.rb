class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :restrict_access
  helper_method :current_user

  # Devise configuration
  skip_before_action :restrict_access, if: :devise_controller?
  layout :set_layout

  protected

  attr_reader :current_user

  def restrict_access
    unless restrict_access_by_params
      render json: { message: 'Invalid API Token' }, status: 401
      return
    end
  end

  def restrict_access_by_params
    return true if @current_user

    @current_user = User.find_by_api_token(params[:api_token])
  end

  def set_layout
    devise_controller? ? 'admin' : false
  end
end
