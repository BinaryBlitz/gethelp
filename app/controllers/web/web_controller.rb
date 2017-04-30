class Web::WebController < ApplicationController
  skip_before_action :restrict_access

  layout 'web'
end
