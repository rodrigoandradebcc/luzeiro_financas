class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.float :value_input
      t.float :value_output
      t.string :description
      t.string :release_date

      t.timestamps null: false
    end
  end
end
