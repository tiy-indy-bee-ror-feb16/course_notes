class AddCostToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :cost, :integer, default: 300
  end
end
