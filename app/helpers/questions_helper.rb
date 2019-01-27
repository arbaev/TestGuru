module QuestionsHelper
  def question_header(question)
    act = question.new_record? ? 'Create' : 'Edit'
    "#{act} question for test «#{question.test.title}»"
  end

  def question_nav(question)
    to_question = link_to 'Back to question', question_path(question)
    to_test = link_to 'Back to test', test_path(question.test)
    to_all_tests = link_to 'Back to all tests', tests_path
    to_question  + ' | ' +  to_test + ' | ' + to_all_tests
  end
end
