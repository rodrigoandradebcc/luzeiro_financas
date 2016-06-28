class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.string :field_of_work
      t.string :address
      t.string :cep
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
