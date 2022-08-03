class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test

  enum status: { in_progress: 0, completed: 1}
end
