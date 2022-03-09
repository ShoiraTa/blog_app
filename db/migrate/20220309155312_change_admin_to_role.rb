class ChangeAdminToRole < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
    remove_column :users, :admin
  end
end
