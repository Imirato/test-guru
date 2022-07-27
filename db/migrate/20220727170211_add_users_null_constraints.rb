# frozen_string_literal: true

class AddUsersNullConstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :email, false)
  end
end
