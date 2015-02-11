class AddDefaultSettingsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :food_notifications, :boolean, :default => true
    change_column :users, :verify_reports, :boolean, :default => true
    change_column :users, :daily_reminders, :boolean, :default => true
  end
end
