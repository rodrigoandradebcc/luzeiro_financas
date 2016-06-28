class CreateThirdLevels < ActiveRecord::Migration
  def change
    create_table :third_levels do |t|
      t.string :code
      t.string :name
      t.references :second_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
