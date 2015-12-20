class Web::UsersController < Web::WebController
  def show
    @user = User.find(session[:user_id])
  end
end
