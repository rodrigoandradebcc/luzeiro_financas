class AddEnterpriseIdToChartOfAccount < ActiveRecord::Migration
  def change
    add_column :chart_of_accounts, :enterprise_id, :integer
    add_index :chart_of_accounts, :enterprise_id
  end
end
