class CreateJoinTableAccountOperation < ActiveRecord::Migration
# rails g migration CreateJoinTableAccountOperation account operation
  def change
    create_join_table :accounts, :operations do |t|
      t.index [:account_id, :operation_id]
      t.index [:operation_id, :account_id]
    end
  end
end
