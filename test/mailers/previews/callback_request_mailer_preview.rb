# Preview all emails at http://localhost:3000/rails/mailers/callback_request_mailer
class CallbackRequestMailerPreview < ActionMailer::Preview
  def new_callback_request
    CallbackRequestMailer.new_callback_request(CallbackRequest.first)
  end
end
