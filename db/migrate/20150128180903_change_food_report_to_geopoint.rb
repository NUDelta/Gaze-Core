class ChangeFoodReportToGeopoint < ActiveRecord::Migration
  def change
    change_column :food_reports, :lat, :decimal, precision: 10, scale: 6
    change_column :food_reports, :lon, :decimal, precision: 10, scale: 6
  end
end
