class CreateSecondSyntheticAccounts < ActiveRecord::Migration
  def change
    create_table :second_synthetic_accounts do |t|
      t.integer :code
      t.string :name
      t.text :description
      t.decimal :balance, precision: 10, scale: 2
      t.references :synthetic_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
