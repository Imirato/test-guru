class ChangeUsersTestsToTestsUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :users_tests, :tests_users
  end
end
