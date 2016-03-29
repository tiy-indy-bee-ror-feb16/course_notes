class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :portion_size
      t.boolean :vegetarian
      t.boolean :gluten_free
      t.string :spice_level

      t.timestamps null: false
    end
  end
end
