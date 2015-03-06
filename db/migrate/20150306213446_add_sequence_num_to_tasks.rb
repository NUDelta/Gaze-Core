class AddSequenceNumToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :sequence_num, :integer
  end
end
