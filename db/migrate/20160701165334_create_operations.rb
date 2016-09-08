class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.float :value
      t.text :description
      t.date :release_date
      t.references :release_account, index: true
      t.references :retrieve_account, index: true
      t.references :operational, polymorphic: true, index: true
      t.timestamps null: false
    end

  end
end
