class TestsController < ApplicationController
  before_action :authenticate_user!, only: %i[start]
  before_action :find_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    @tests = Test.all
    if user_admin?
      redirect_to admin_tests_path
    end
  end

  def start
    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_from_test_not_found
    render plain: 'Test not found'
  end
end
