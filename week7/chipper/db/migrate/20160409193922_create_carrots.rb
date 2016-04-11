class CreateCarrots < ActiveRecord::Migration
  def change
    create_table :carrots do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
