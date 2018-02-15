class NotificationMailer < ApplicationMailer

	def send_when_create(customer,classwork)
	    @customer = customer
	    @classwork = classwork
	    @url = "#"
	    mail to: customer.email,
	         subject: 'お問い合わせを受け付けました。'
	end
# 	default from: "hogehoge@example.com"

# 	def send_confirm_to_customer(customer)
# 	    @customer = customer
# 	    mail(
# 	      subject: "お問い合わせを受け付けました。" ,
# 	      to: @customer.email) do |format|
# 	      format.text
# 	      end
#     end

end
