class AddUserToDevice < ActiveRecord::Migration
  def change
    add_column :users, :device_id, :integer
  end
end
