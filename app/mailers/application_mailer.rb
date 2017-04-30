class ApplicationMailer < ActionMailer::Base
  default from: 'orders@getthelp.ru'
  layout 'mailer'

  before_action :set_locale

  private

  def set_locale
    I18n.locale = :ru
  end
end
