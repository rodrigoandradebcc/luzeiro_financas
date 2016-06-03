class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
