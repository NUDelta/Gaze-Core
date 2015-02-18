class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.string :question_text
      t.string :question_options, array: true, default: []
      t.integer :task_id
      t.timestamps
    end
  end
end
