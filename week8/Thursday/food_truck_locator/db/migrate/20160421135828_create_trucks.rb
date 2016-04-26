class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.text :description
      t.string :food_style

      t.timestamps null: false
    end
  end
end
