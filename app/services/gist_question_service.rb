class GistQuestionService

  GistResult = Struct.new(:gist_url, :success?)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)

    GistResult.new(result.html_url, success?)
  end

  private

  def success?
    @client.last_response.status == 201
  end

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
  end

  def gist_params
    {
      description: I18n.t('gist_description', test_tittle: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
