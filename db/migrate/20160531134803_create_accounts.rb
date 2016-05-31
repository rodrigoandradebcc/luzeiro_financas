class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :type
      t.string :code
      t.string :description
      t.float :credit_balance
      t.float :debit_balance

      t.timestamps null: false
    end
  end
end
