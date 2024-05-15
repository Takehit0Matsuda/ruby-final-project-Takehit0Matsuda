class RenameLogIdToMealLogIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :log_id, :meal_log_id
  end
end
