class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.string :name
      t.integer :ibu
      t.text :description
      t.integer :abv
      t.string :style

      t.timestamps null: false
    end
  end
end
