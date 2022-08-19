module QuestionsHelper
  def question_header(question)
    header = "вопроса для теста #{question.test.title}"
    question.new_record? ? "Создание #{header}" : "Изменение #{header}"
  end
end
