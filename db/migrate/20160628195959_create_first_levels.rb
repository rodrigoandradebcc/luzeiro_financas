class CreateFirstLevels < ActiveRecord::Migration
  def change
    create_table :first_levels do |t|
      t.string :code
      t.string :name
      t.string :description
      t.references :chart_of_account, index: true, foreign_key: true
      t.references :balance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
