module TestPassagesHelper
  def total_questions_helper
    "Total questions: #{@test_passage.test.total_questions}"
  end
end
