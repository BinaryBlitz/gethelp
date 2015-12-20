class Web::PagesController < ApplicationController
  skip_before_action :restrict_access
  layout 'landing'

  def home
  end
end
