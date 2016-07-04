class CreateAnalyticAccounts < ActiveRecord::Migration
  def change
    create_table :analytic_accounts do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.float :balance , default: 0.0
      t.references :synthetic_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
