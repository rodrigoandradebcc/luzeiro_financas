class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.text :description
      t.references :analytic_account, index: true, foreign_key: true
      t.string :kind
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
