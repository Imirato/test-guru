class QuestionsController < ApplicationController

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def rescue_with_question_not_found
    render plain: 'Данный вопрос не найден'
  end
end
