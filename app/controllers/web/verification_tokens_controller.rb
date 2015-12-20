class Web::VerificationTokensController < ApplicationController
  skip_before_action :restrict_access
  before_action :set_verification_token, only: [:edit, :update]

  def new
    @verification_token = VerificationToken.new
  end

  def create
    @verification_token = VerificationToken.new(verification_token_params)

    if @verification_token.save
      redirect_to edit_web_verification_token_path(@verification_token.token), notice: 'На ваш номер отправлено сообщение.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    unless @verification_token.verify(entered_code)
      render :edit and return
    end

    @user = User.find_or_initialize_by(phone_number: @verification_token.phone_number)
    @user.verification_token = @verification_token.token

    if @user.save
      session[:user_id] = @user.id
      redirect_to web_user_path
    else
      redirect_to root_path
    end
  end

  private

  def verification_token_params
    params.require(:verification_token).permit(:phone_number)
  end

  def set_verification_token
    @verification_token = VerificationToken.find_by!(token: params[:token])
  end

  def entered_code
    params[:verification_token][:entered_code].to_i
  end
end
