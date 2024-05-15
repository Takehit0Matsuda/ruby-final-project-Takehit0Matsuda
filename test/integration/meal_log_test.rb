require "test_helper"

class MealLogTest < ActionDispatch::IntegrationTest

  test "create a meal_log" do
    meal_log = FactoryBot.build :meal_log
    
    assert meal_log.valid?
  end
  
  test "requires a Meal_name" do
    meal_log = FactoryBot.build :meal_log
    meal_log.Meal_name = ""
    
    refute meal_log.valid?
  end
  
  test "requires a calorie" do
    meal_log = FactoryBot.build :meal_log
    meal_log.Calorie = nil
    
    refute meal_log.valid?
  end
  
  test "requires a category" do
    meal_log = FactoryBot.build :meal_log
    meal_log.category = nil
    
    refute meal_log.valid?
  end
end
