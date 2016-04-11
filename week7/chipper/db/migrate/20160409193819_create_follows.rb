class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :followed, index: true
      t.references :follower, index: true

      t.timestamps null: false
    end
  end
end
