class Admin::NotificationsController < Admin::AdminController
  def index
  end

  def create
    message = params[:message]
    User.all.find_each { |user| Notifier.new(user, message) }
    redirect_to admin_notifications_path, notice: 'Уведомление успешно отправлено'
  end
end
