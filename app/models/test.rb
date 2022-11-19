# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: :Admin, foreign_key: :author_id

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :passage_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (name) { joins(:category).where(category: { title: name }) }
  scope :visible, -> { where(visibility_status: true) }

  def self.titles_by_category(name)
    by_category(name).order(title: :desc).pluck(:title)
  end
end
