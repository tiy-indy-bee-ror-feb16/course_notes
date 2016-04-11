class CreateCarrotings < ActiveRecord::Migration
  def change
    create_table :carrotings do |t|
      t.references :carrot, index: true, foreign_key: true
      t.references :cheep, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
