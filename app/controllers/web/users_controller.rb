class Web::UsersController < ApplicationController
  skip_before_action :restrict_access

  def show
    @user = User.find(session[:user_id])
  end
end
