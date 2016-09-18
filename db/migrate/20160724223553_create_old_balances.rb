class CreateOldBalances < ActiveRecord::Migration
  def change
    create_table :old_balances do |t|
      t.references :operation, index: true, foreign_key: true
      t.references :analytic_account, index: true, foreign_key: true
      t.decimal :value, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
