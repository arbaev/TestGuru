class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline_form]
  before_action :find_test, only: %i[show edit update destroy update_inline_form]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index; end

  def show
    @questions = @test.questions.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authorships.build(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.notice')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def update_inline_form
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.notice')
    else
      render :index
    end
  end

  def destroy
    @test.destroy!

    redirect_to admin_tests_path, notice: t('.notice')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_from_test_not_found
    redirect_to admin_tests_path, alert: t('.alert.not_found')
  end
end
