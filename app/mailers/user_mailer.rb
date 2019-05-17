class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @user = order.email
    @id = order.id
    @order = order
    mail(to: @user, subject: "Receipt of your order #{@order.id}")
  end
end
