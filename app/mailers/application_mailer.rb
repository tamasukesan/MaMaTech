class ApplicationMailer < ActionMailer::Base
  default from: "管理人 <mamatech.info@gmail.com>",
          bcc: "sent@gmail.com",
          reply_to: "reply@gmail.com"
  layout 'mailer'
end
