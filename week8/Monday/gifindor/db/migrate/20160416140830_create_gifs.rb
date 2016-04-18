class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :image_url
      t.integer :total_score

      t.timestamps null: false
    end
  end
end
