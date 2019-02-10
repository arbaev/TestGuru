class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
        description: I18n.t('.gist_question_service.gist_description', title: @test.title),
        files: {
            'testguru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
