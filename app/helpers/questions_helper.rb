module QuestionsHelper
  def question_header(question)
    act = question.new_record? ? 'Create' : 'Edit'
    "#{act} question for test «#{question.test.title}»"
  end
end
