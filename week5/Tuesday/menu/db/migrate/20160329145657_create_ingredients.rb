class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :unit
      t.boolean :contains_gluten
      t.boolean :contains_meat
      t.string :quality
      t.integer :dish_id

      t.timestamps null: false
    end
  end
end
