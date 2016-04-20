class AddAttachmentImageToBrews < ActiveRecord::Migration
  def self.up
    change_table :brews do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :brews, :image
  end
end
