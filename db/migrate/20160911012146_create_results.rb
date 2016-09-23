class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.text :description
      t.references :analytic_account, index: true, foreign_key: true
      t.string :kind
      t.decimal :balance, precision: 10, scale: 2, default: 0.0

      t.timestamps null: false
    end
  end
end
