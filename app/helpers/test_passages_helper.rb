module TestPassagesHelper

  MINIMUM_RESULT = 85

  def result_percent(test_passage)
    test_passage.correct_questions / test_passage.test.questions.count * 100
  end

  def successful_passage?(test_passage)
    result_percent(test_passage) >= MINIMUM_RESULT
  end

end
