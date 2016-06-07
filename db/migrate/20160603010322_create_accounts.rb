class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :nature_of_the
      t.string :balance
      t.float :credit_balance
      t.float :debit_balance

      t.timestamps null: false
    end  
  end
end
