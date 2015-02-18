class AddQuestionIdToAnswers < ActiveRecord::Migration
  def change
  	rename_column :answers, :value, :response
  	add_column :answers, :question_id, :integer
  end
end
