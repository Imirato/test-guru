# frozen_string_literal: true

class User < ApplicationRecord
  def test_list_by_level(test_level)
    Test.where(level: test_level)
        .joins('INNER JOIN users_tests ON tests.id = users_tests.test_id')
        .where(users_tests: { user_id: id })
  end
end
