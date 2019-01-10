class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_quantity, on: :create

  scope :right_answers, -> { where(correct: true) }

  private

  def validate_answers_quantity
    if question.answers.count >= MAX_ANSWERS
      errors.add(:answers_quantity, "Should be #{MAX_ANSWERS} answers max.")
    end
  end
end
