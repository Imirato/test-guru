class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def new; end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.delete
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.order(:id)[params[:id].to_i - 1]
    raise ActiveRecord::RecordNotFound unless @question
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Данный вопрос не найден'
  end
end
