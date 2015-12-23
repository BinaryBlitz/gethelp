class Web::PagesController < Web::WebController
  skip_before_action :authenticate_user!
  layout 'landing'

  def home
  end
end
