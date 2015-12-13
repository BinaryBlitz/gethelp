class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def show
  end

  def create
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = current_user
  end
end
