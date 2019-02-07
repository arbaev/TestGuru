class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!

    redirect_to admin_test_path(@question.test), notice: t('.notice')
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    redirect_to admin_tests_path, alert: t('.alert.not_found')
  end
end
