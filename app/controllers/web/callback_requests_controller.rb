class Web::CallbackRequestsController < Web::WebController
  skip_before_action :authenticate_user!

  def new
    @callback_request = CallbackRequest.new
  end

  def create
    @callback_request = CallbackRequest.new(callback_request_params)

    if @callback_request.save
      redirect_to web_callback_requests_path, notice: 'Спасибо, мы перезвоним вам в течении 5 минут.'
    else
      render :new
    end
  end

  private

  def callback_request_params
    params.require(:callback_request).permit(:name, :phone_number)
  end
end
