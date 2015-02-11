class SimplifyAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :user_id 
    remove_column :answers, :event_id 
  end
end
