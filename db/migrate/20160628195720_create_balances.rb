class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.float :debit, default: 0
      t.float :credit, default: 0
      t.float :total, default: 0

      t.timestamps null: false
    end
  end
end
