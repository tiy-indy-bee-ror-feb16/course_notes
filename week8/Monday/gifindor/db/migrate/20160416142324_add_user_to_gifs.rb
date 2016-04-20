class AddUserToGifs < ActiveRecord::Migration
  def change
    add_reference :gifs, :user, index: true, foreign_key: true
  end
end
