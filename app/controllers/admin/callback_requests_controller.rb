class Admin::CallbackRequestsController < Admin::AdminController
  before_action :authorize_admin

  def index
    @callback_requests = CallbackRequest.all.order(created_at: :desc).page(params[:page])
  end
end
