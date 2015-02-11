class CreateFoodReports < ActiveRecord::Migration
  def change
    create_table :food_reports do |t|
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
