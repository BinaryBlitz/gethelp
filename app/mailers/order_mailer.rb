class OrderMailer < ApplicationMailer
  def new_order(order)
    @order = order
    mail(to: Rails.application.secrets.recipient_mail, subject: "Заказ №#{@order.id}")
  end
end
