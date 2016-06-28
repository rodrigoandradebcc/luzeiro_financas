class CreateJoinTableFourthLevelOperation < ActiveRecord::Migration
  def change
    create_join_table :fourth_levels, :operations do |t|
      # t.index [:fourth_level_id, :operation_id]
      # t.index [:operation_id, :fourth_level_id]
    end
  end
end
