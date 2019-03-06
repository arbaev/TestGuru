class TestPassage < ApplicationRecord
  # процент правильных ответов выше которого тест засчитывается успешно пройденным
  SUCCESS_VALUE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question
  before_save :calc_result, if: :completed?

  def accept!(answer_ids)
    if in_time?
      self.score += 1 if correct_answer?(answer_ids)
      save!
    else
      self.current_question = nil
    end
  end

  def completed?
    current_question.nil?
  end

  def result_percentage
    score * 100 / test.total_questions
  end

  def successful?
    in_time? && result_percentage >= SUCCESS_VALUE if completed?
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question).size
  end

  def passage_duration
    (Time.current - self.created_at).to_i
  end

  def remain_duration
    self.test.duration - passage_duration
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

  def calc_result
    self.result = result_percentage
  end

  def in_time?
    duration = self.test.duration

    duration.zero? || passage_duration <= duration
  end
end
