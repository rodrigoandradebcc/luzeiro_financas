class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.string :debit
      t.string :credit
      t.string :total

      t.timestamps null: false
    end
  end
end
