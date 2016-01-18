class Admin::NotificationsController < Admin::AdminController
  before_action :authorize_admin
  
  def index
    @notifications = Notification.order(created_at: :desc)
  end

  def create
    @notification = Notification.create(message: params[:message])
    redirect_to admin_notifications_path, notice: 'Уведомление успешно отправлено.'
  end
end
