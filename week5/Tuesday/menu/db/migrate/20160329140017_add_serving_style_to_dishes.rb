class AddServingStyleToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :serving_style, :string
  end
end
