class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :color, default: "#DCDDDD"
      t.integer :average_calorie

      t.timestamps
    end
  end
end
