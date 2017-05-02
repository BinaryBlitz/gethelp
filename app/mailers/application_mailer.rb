class ApplicationMailer < ActionMailer::Base
  default from: 'orders@gethelp24.ru'
  layout 'mailer'

  before_action :set_locale

  private

  def set_locale
    I18n.locale = :ru
  end
end
