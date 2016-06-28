class CreateFifthLevels < ActiveRecord::Migration
  def change
    create_table :fifth_levels do |t|
      t.string :code
      t.string :name
      t.boolean :analytic
      t.references :balance, index: true, foreign_key: true
      t.references :fourth_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
