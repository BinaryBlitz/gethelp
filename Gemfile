source 'https://rubygems.org'

ruby '~> 2.7.5'

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.6'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.6'

# Front-end
gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap-datepicker-rails', '~> 1.6.4'
gem 'bootstrap-select-wrapper-rails', '~> 1.10'
gem 'devise-bootstrap-views', '~> 0.0'

# Auth
gem 'devise', '~> 4.2'
gem 'has_secure_token', '~> 1.0'

# Utilities
gem 'httparty', '~> 0.14'
gem 'phony_rails', '~> 0.14'
gem 'enumerize', '~> 2.1'

# Image processing
gem 'carrierwave', '~> 0.11'
gem 'carrierwave-base64', '~> 2.5'
gem 'mini_magick', '~> 4.7'
gem 'kaminari', '~> 1.0'
gem 'phonelib', '~> 0.6'

# Payments
gem 'rubykassa', '~> 0.4'
# Push notifications
gem 'rpush', '~> 2.7'
# I18n
gem 'rails-i18n'
# Monitoring
gem 'rollbar'
gem 'scout_apm'

group :development, :test do
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Annotations
  gem 'annotate'
end

group :production do
  gem 'rails_12factor'
  gem 'fog-aws', '~> 0.13'
end
