class AddPostsCountToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :posts_count, :integer
  end
end
