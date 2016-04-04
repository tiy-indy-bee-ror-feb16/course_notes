class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :summary
      t.string :url

      t.timestamps null: false
    end
  end
end
