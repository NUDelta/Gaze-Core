class ChangeConfirmedTaskToString < ActiveRecord::Migration
  def up
    change_column :tasks, :confirmed, :string
  end

  def down
    change_column :tasks, :confirmed, :boolean
  end
end
