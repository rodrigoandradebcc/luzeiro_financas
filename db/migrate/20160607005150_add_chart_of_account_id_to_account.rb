class AddChartOfAccountIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :chart_of_account_id, :integer
    add_index :accounts, :chart_of_account_id
  end
end
