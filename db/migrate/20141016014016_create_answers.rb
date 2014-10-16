class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.integer :user_id
      t.integer :task_id
      t.integer :event_id
      t.string :value

      t.timestamps
    end

    add_index :answers, :user_id
    add_index :answers, :task_id
    add_index :answers, :event_id
  end
end
