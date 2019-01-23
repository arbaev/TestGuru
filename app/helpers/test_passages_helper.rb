module TestPassagesHelper
  def total_questions_helper
    "Total questions: #{@test_passage.test.total_questions}"
  end

  def result_message(result)
    if result >= 85
      content_tag(:h2,
                  "Congratulations! Your result is #{result}%, you passed the test.",
                  class: 'result_success')
    else
      content_tag(:h2,
                  "Sorry! Your result is #{result}%, you failed the test.",
                  class: 'result_fail')
    end
  end
end
