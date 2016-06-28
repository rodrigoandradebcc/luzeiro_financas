class CreateSixthLevels < ActiveRecord::Migration
  def change
    create_table :sixth_levels do |t|
      t.string :code
      t.string :name
      t.boolean :analytic
      t.references :balance, index: true, foreign_key: true
      t.references :fifth_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
