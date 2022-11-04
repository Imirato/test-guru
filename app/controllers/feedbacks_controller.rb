class FeedbacksController < ApplicationController
  def new; end

  def create
    user_message = params.dig(:contact_form, :message)

    if message_valid?(user_message)
      FeedbacksMailer.send_form(user: current_user, message: user_message).deliver_now

      redirect_to new_feedback_path
    else

      render :new
    end
  end

  private

  def message_valid?(message)
    message.present?
  end
end
