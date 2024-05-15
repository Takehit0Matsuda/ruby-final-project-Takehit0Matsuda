class AddDefaultRateToComments < ActiveRecord::Migration[7.0]
  def change
    change_column_default :comments, :rate, 5
  end
end
