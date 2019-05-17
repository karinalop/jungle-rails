class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @user = order.email
    @id = order.id
    mail(to: @user.email, subject: "Receipt of your order #{@id}")
  end
end
