class AddImageToMealLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :meal_logs, :image, :string
  end
end
