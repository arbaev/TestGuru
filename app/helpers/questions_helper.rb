module QuestionsHelper
  def question_header
    act = params[:action] == 'new' ? 'Create' : 'Edit'
    "#{act} question for test «#{@test.title}»"
  end

  def question_nav
    to_test = link_to 'Back to test', @test
    to_all_tests = link_to 'Back to all tests', tests_path
    to_test + ' | ' + to_all_tests
  end
end
