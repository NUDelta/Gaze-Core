class AddSequenceNumToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :sequence_num, :integer
  end
end
