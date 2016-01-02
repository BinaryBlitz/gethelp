class RobokassaController < ApplicationController
  skip_before_action :restrict_access
  before_action :set_notification

  def paid
    logger.debug @notification
    render text: 'paid'
  end

  def success
    logger.debug @notification
    render text: 'success'
  end

  def fail
    logger.debug @notification
    render text: 'fail'
  end

  private

  def set_notification
    @notification = Rubykassa::Notification.new request.request_parameters
  end
end
