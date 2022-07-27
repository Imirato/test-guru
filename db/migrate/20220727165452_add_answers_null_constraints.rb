# frozen_string_literal: true

class AddAnswersNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
  end
end
