class CreateSecondLevels < ActiveRecord::Migration
  def change
    create_table :second_levels do |t|
      t.string :code
      t.string :name
      t.references :balance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
