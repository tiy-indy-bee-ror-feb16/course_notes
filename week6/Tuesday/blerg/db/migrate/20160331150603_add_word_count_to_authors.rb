class AddWordCountToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :word_count, :integer, default: 0
  end
end
