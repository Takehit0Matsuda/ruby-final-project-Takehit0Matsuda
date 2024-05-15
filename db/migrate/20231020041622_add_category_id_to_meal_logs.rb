class AddCategoryIdToMealLogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :meal_logs, :category, null: false, foreign_key: true, default:1 
  end
end
