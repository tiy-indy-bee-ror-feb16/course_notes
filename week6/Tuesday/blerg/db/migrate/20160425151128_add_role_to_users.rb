class AddRoleToUsers < ActiveRecord::Migration
  def up
    add_column :authors, :role, :string, default: 'author'
  end

  def down
    remove_column :authors, :role
  end
end
