class Web::DepositsController < Web::WebController
  def index
    @user = User.find(session[:user_id])
  end
end
