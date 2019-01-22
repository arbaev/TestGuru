module TestPassagesHelper
  def total_questions_helper
    "Total questions: #{@test_passage.test.total_questions}"
  end

  def result_message(success)
    if success >= 85
      content_tag(:h2,
                  "Congratulations! Your result is #{success}%, you passed the test.",
                  class: 'result_success')
    else
      content_tag(:h2,
                  "Sorry! Your result is #{success}%, you failed the test.",
                  class: 'result_fail')
    end
  end
end
