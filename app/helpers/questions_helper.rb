module QuestionsHelper
  def question_header(question)
    act = question.new_record? ? t('helpers.question.create') : t('helpers.question.edit')
    t('helpers.question.qheader', act: act, title: question.test.title)
  end
end
