class CreateJoinTableOperationSixthLevel < ActiveRecord::Migration
  def change
    create_join_table :operations, :sixth_levels do |t|
      # t.index [:operation_id, :sixth_level_id]
      # t.index [:sixth_level_id, :operation_id]
    end
  end
end
