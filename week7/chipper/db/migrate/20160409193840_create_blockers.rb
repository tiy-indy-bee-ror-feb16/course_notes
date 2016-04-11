class CreateBlockers < ActiveRecord::Migration
  def change
    create_table :blockers do |t|
      t.references :blocker, index: true
      t.references :blocked, index: true

      t.timestamps null: false
    end
  end
end
