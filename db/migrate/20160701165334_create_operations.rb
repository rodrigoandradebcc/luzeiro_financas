class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.decimal :value, :decimal, :precision => 10, :scale => 2
      t.text :description
      t.date :release_date
      t.references :release_account, index: true
      t.references :retrieve_account, index: true
      t.references :operational, polymorphic: true, index: true
      t.timestamps null: false
    end

  end
end
