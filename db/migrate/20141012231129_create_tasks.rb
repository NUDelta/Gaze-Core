class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :question
      t.integer :size

      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :task_id

  end
end
