class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.decimal :balance, precision: 10, scale: 2
      t.references :account_type, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
