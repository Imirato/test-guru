class Badge < ApplicationRecord
  enum rule: { all_tests_by_category: 0, first_successful_attempt: 1 }

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :image, :rule, :object_title, presence: true

end
