class Admin::CallBacksController < Admin::AdminController
  before_action :authorize_admin

  def index
    @call_backs = CallBack.all.order(created_at: :desc).page(params[:page])
  end
end
