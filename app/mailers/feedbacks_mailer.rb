class FeedbacksMailer < ApplicationMailer
  def send_form(user:, message:)
    @user = user
    @message = message

    mail to: ENV['ADMIN_EMAIL'], subject: user.email
  end
end
