class AddImageIdToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :image_id, :string
  end
end
