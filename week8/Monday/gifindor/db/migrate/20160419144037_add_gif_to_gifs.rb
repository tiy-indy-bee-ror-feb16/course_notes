class AddGifToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :gif_id, :string
  end
end
