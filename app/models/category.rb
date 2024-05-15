class Category < ApplicationRecord
    has_many :meal_logs
    
    validates :name, presence: true, uniqueness: true
    
    def calculate_average_calorie
        total_calories = meal_logs.sum(:Calorie)
        total_meal_logs = meal_logs.count
    
        self.average_calorie = total_calories.to_f / total_meal_logs if total_meal_logs.positive?
        
    end
    
    
end
