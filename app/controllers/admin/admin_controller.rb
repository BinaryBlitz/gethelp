class Admin::AdminController < ActionController::Base
  before_action :authenticate_admin!
  layout 'admin'

  protected

  def authorize_admin
    raise ActionController::RoutingError.new('Not Found') unless current_admin.admin?
  end
end
