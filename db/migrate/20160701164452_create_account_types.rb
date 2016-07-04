class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :code
      t.string :name
      t.references :chart_of_account, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
