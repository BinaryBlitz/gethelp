class ApplicationMailer < ActionMailer::Base
  default from: "postmaster@#{Rails.application.secrets.mailgun_domain}"
  layout 'mailer'

  before_action :set_locale

  private

  def set_locale
    I18n.locale = :ru
  end
end
