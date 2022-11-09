class AddVisibilityStatusToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :visibility_status, :boolean, default: false
  end
end
