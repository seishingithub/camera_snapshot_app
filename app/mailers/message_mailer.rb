class MessageMailer < ActionMailer::Base
  default from: "from@example.com"

  def message_email(message)
    @message = message
    @url  = 'http://example.com/login'
    mail(to: @message.recipient_email, subject: "#{@message.sender_name} has sent you an eCard!")
  end
end
