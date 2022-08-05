# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers

  scope :correct, -> { where(correct: true).order(created_at: :desc) }

  private

  def validate_number_of_answers
    errors.add(:number_answers) if question.answers.count > 4
  end
end
