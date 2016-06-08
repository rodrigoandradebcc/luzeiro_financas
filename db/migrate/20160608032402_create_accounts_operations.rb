class CreateAccountsOperations < ActiveRecord::Migration
# rails g migration CreateAccountsOperations account:references operation:references
  def change
    create_table :accounts_operations do |t|
      t.references :account, index: true, foreign_key: true
      t.references :operation, index: true, foreign_key: true
    end
  end
end
