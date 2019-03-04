module TestPassagesHelper
  def total_questions_helper
    t('helpers.test_passage.total', total: @test_passage.test.total_questions)
  end

  def result_message(result)
    if @test_passage.successful?
      content_tag(:h2, t('helpers.test_passage.success', result: result), class: 'text-success')
    elsif @test_passage.result >= TestPassage::SUCCESS_VALUE
      content_tag(:h2, t('helpers.test_passage.time', result: result, time: @test_passage.passage_duration, duration: @test_passage.test.duration), class: 'text-danger')
    else
      content_tag(:h2, t('helpers.test_passage.fail', result: result), class: 'text-danger')
    end
  end
end
