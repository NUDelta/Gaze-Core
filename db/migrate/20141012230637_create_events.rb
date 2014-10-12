class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer :user_id
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.decimal :heading, precision: 6, scale: 3
      t.integer :task_id

      t.timestamps
    end
  end
end
