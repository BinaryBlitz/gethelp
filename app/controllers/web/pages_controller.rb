class Web::PagesController < ApplicationController
  skip_before_action :restrict_access

  def home
  end
end
