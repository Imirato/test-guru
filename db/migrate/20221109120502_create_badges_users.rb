class CreateBadgesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_users do |t|
      t.references :badge, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
