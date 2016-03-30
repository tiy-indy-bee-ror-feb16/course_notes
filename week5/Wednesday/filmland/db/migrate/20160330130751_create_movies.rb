class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :rating
      t.integer :year_released
      t.integer :box_office

      t.timestamps null: false
    end
  end
end
