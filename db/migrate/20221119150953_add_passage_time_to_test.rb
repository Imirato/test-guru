class AddPassageTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :passage_time, :integer
  end
end
