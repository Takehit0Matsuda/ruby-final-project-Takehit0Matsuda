class AddDefaultColorToCategories < ActiveRecord::Migration[6.0]
  def change
    change_column_default :categories, :color, "#DCDDDD"
  end
end