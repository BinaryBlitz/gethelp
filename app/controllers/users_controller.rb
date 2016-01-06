class UsersController < ApplicationController
  skip_before_action :restrict_access, only: :create
  before_action :set_user, only: [:show, :update, :destroy]

  def show
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: 422
    end
  end

  def update
    if @user.update(user_params)
      head :ok
    else
      render json: @user.errors, status: 422
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:phone_number, :verification_token, :device_token, :platform)
  end
end
