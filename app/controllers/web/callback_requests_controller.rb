class Web::CallbackRequestsController < Web::WebController
  def create
    @callback_request = CallbackRequest.new(callback_request_params)

    if @callback_request.save
      redirect_to root_path, notice: 'Спасибо, мы перезвоним вам в течении 5 минут.'
    else
      render template: 'web/pages/home'
    end
  end

  private

  def callback_request_params
    params.require(:callback_request).permit(:name, :phone_number)
  end
end
