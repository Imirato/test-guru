# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: :Test, inverse_of: :author, foreign_key: :author_id

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level:)
  end
end
