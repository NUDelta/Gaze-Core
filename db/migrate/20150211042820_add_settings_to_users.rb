class AddSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :food_notifications, :boolean
    add_column :users, :verify_reports, :boolean
    add_column :users, :daily_reminders, :boolean
  end
end
