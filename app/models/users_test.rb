class UsersTest < ApplicationRecord
  enum status: { in_progress: 0, completed: 1}
end
