class CreateSubitems < ActiveRecord::Migration
  def change
    create_table :subitems do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
