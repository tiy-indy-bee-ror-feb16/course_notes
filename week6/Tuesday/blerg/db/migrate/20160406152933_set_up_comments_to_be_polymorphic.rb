class SetUpCommentsToBePolymorphic < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :commentable_id
    add_column :comments, :commentable_type, :string, default: 'Post'
  end
end
