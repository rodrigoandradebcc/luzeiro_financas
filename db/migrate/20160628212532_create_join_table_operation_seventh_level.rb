class CreateJoinTableOperationSeventhLevel < ActiveRecord::Migration
  def change
    create_join_table :operations, :seventh_levels do |t|
      # t.index [:operation_id, :seventh_level_id]
      # t.index [:seventh_level_id, :operation_id]
    end
  end
end
