class MealLog < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :category
    belongs_to :user, optional: true
    has_many :comments
    
    validates :Meal_name, presence: true
    validates :Calorie, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
    
    
    after_save :update_category_average_calorie

    private

    def update_category_average_calorie
        category&.calculate_average_calorie
        category&.save
    end
    
end
