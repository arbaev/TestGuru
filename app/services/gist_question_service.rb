class GistQuestionService
  attr_reader :post, :question

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
    @post = create_gist
  end

  def success?
    url.present?
  end

  def url
    post.html_url
  end

  private

  def create_gist
    @client.create_gist(gist_params)
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_description', title: @test.title),
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

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end
end
