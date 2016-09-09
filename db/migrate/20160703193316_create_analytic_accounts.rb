class CreateAnalyticAccounts < ActiveRecord::Migration
  def change
    create_table :analytic_accounts do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.decimal :balance, :decimal, :precision => 10, :scale => 2
      t.references :second_synthetic_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
