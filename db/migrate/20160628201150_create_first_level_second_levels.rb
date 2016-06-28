class CreateFirstLevelSecondLevels < ActiveRecord::Migration
  def change
    create_table :first_level_second_levels do |t|
      t.string :account_type
      t.string :group_type
      t.references :first_level, index: true, foreign_key: true
      t.references :second_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
