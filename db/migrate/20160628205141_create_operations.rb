class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.float :value
<<<<<<< HEAD:db/migrate/20160628205141_create_operations.rb
      t.text :description
      t.date :launch_date
=======
      t.string :description
      t.string :release_date
>>>>>>> 8fcd3ff446731673164eaabacc396d576e15daef:db/migrate/20160605141631_create_operations.rb

      t.timestamps null: false
    end
  end
end
