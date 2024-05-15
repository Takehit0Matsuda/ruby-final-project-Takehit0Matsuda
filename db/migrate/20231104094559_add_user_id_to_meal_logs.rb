class AddUserIdToMealLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :meal_logs, :user_id, :integer
  end
end
