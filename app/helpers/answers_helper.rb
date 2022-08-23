module AnswersHelper
  def answer_header(answer)
    header = "ответа для вопроса: #{answer.question.body}"
    answer.new_record? ? "Создание #{header}" : "Изменение #{header}"
  end
end
