class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.integer :code
      t.string :name
      t.float :total_balance
      t.references :chart_of_account, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
