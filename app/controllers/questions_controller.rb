class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from StandardError, with: :rescue_from_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
  end

  def new
  end

  def create
    @test.questions.create!(question_params)

    redirect_to test_questions_url
  end

  def destroy
    @test.questions[params[:id].to_i].destroy!

    redirect_to test_questions_url
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
