class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :rate, default: 5, null: false, limit: 1
      t.text :comment_body
      t.integer :log_id

      t.timestamps
    end
  end
end
