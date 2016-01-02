class RobokassaController < ApplicationController
  skip_before_action :restrict_access
  before_action :set_notification

  def paid
    if @notification.valid_result_signature?
      Payment.find(@notification.params['InvId']).set_paid
      render json: { message: 'paid' }
    else
      render json: { message: 'fail' }
    end
  end

  def success
    if @notification.valid_success_signature?
      render json: { message: 'success' }
    else
      render json: { message: 'fail' }
    end
  end

  def fail
    logger.debug @notification
    render json: { message: 'fail' }
  end

  private

  def set_notification
    @notification = Rubykassa::Notification.new(request.request_parameters)
  end
end
