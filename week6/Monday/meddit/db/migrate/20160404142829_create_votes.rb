class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :link, index: true, foreign_key: true
      t.integer :value, default: 1

      t.timestamps null: false
    end
  end
end
