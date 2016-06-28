class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.float :value
      t.text :description
      t.date :launch_date

      t.timestamps null: false
    end
  end
end
