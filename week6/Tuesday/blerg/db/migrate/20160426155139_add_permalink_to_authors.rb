class AddPermalinkToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :permalink, :string
    add_index :authors, :permalink, unique: true
  end
end
