class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  SUCCESS_VALUE = 85

  def accept!(answer_ids)
    self.score += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_percentage
    (score * 100.0 / test.total_questions).round(2)
  end

  def successful?
    if completed?
      result_percentage >= SUCCESS_VALUE
    end
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question).size
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right_answers
  end
end
