class Web::DepositsController < ApplicationController
  skip_before_action :restrict_access

  def index
    @user = User.find(session[:user_id])
  end
end
