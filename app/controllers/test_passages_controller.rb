class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      UserBadgeService.new(@test_passage).give_badges if @test_passage.successful?

      # FIXME: отключено на время разработки беджей и таймера
      # TestsMailer.completed_test(@test_passage).deliver_now

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_post = GistQuestionService.new(@test_passage.current_question)
    if gist_post.success?
      Gist.create!(url: gist_post.url,
                   user: @test_passage.user,
                   question: @test_passage.current_question)

      flash[:notice] = t('.success_html', url: gist_post.url)
    else
      flash[:alert] = t('.fail')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
