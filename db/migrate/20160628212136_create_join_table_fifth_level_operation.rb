class CreateJoinTableFifthLevelOperation < ActiveRecord::Migration
  def change
    create_join_table :fifth_levels, :operations do |t|
      # t.index [:fifth_level_id, :operation_id]
      # t.index [:operation_id, :fifth_level_id]
    end
  end
end
