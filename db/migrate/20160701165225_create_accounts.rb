class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :code
      t.string :name
      t.text :description
      t.float :balance, default: 0.0
      t.references :account_type, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
