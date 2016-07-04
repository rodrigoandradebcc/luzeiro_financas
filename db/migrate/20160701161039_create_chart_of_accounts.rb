class CreateChartOfAccounts < ActiveRecord::Migration
  def change
    create_table :chart_of_accounts do |t|
      t.string :title
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
