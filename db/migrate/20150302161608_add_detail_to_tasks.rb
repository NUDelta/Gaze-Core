class AddDetailToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :confirmed, :boolean
    add_column :tasks, :building, :string
    add_column :tasks, :floor_number, :string
    add_column :tasks, :food_drink, :string
    add_column :tasks, :food_type, :string
    add_column :tasks, :drink_type, :string
    add_column :tasks, :free_for_anyone, :string
  end
end
