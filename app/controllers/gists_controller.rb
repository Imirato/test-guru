class GistsController < ApplicationController
  before_action :find_test_passage, only: %i[create]

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success?
                      @test_passage.current_question.gists.create(user: current_user, url: result.gist_url)
                      { notice: t('.success', link: result.gist_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
