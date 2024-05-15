class Comment < ApplicationRecord
    belongs_to :meal_log
    
    validates :title, presence: true
    validates :comment_body, presence: true
    validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
