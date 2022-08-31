class AnswersController < ApplicationController

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  private

  def rescue_with_answer_not_found
    render plain: 'Данный ответ не найден'
  end
end
