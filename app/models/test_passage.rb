class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :update_success_status

  scope :succeed, -> { where(success: true) }
  scope :failed, -> { where(success: false) }

  MINIMUM_RESULT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    self.current_question = next_question

    save!
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def result_percent
    correct_questions / test.questions.count * 100
  end

  def successful_passage?
    result_percent >= MINIMUM_RESULT && !out_of_time?
  end

  def passing_progress
    questions_count = test.questions.order(:id).index(current_question)
    (questions_count.to_f / test.questions.count * 100).round
  end

  def out_of_time?
    return false if test.passage_time.nil?

    created_at + test.passage_time.minutes <= Time.zone.now
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answers_ids).count) &&
      correct_answers_count == answers_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def update_success_status
    self.success = true if successful_passage?
  end
end
