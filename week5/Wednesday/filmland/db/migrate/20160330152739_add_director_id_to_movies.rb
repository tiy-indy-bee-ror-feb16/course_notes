class AddDirectorIdToMovies < ActiveRecord::Migration
  def change
    add_reference :movies, :director, index: true, foreign_key: true
  end
end
