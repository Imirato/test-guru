# frozen_string_literal: true

class Test < ApplicationRecord
  def self.test_array_by_category(name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: name }).order(title: :desc)
        .pluck(:title)
  end
end
