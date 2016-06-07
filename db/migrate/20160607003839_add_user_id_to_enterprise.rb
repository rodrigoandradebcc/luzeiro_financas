class AddUserIdToEnterprise < ActiveRecord::Migration
  def change
    add_column :enterprises, :user_id, :integer
    add_index :enterprises, :user_id
  end
end
