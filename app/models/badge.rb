class Badge < ApplicationRecord
  enum rule: { all_tests_by_category: 0, first_successful_attempt: 1 }

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :image, :rule, :object_title, presence: true
  validate :object_title_should_be_similar_to_test_title, if: :first_successful_attempt?
  validate :object_title_should_be_similar_to_category_title, if: :all_tests_by_category?

  def object_title_should_be_similar_to_test_title
    errors.add(:object_title, "doesn't exist") if Test.where(title: object_title).empty?
  end

  def object_title_should_be_similar_to_category_title
    errors.add(:object_title, "doesn't exist") if Category.where(title: object_title).empty?
  end
end
