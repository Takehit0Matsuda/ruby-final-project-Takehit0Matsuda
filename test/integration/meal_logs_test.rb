require "test_helper"

class MealLogsTest < ActionDispatch::IntegrationTest
  test "meal_log index page shows all users meal_logs and comments" do
    user = login_user
    meal_log1 = FactoryBot.create :meal_log, user: user
    meal_log2 = FactoryBot.create :meal_log, user: user
    meal_log3 = FactoryBot.create :meal_log
    
    visit meal_logs_path
    
    puts "=== Debug Information ==="
    puts "User1: #{user.name}"
    puts "Meal Log 1: #{meal_log1.user.name}"
    puts "Meal Log 2: #{meal_log2.user.name}"
    puts "Meal Log 3: #{meal_log3.user.name}"
    
    assert_text meal_log1.Meal_name
    assert_text meal_log2.Meal_name
    assert_text meal_log3.Meal_name
    
    visit meal_log_path(meal_log1)
    puts "Current page: #{current_path}"
    
    click_on "See Comments"
    puts "Current page: #{current_path}"
    
    click_on "Back to Meal Log"
    puts "Current page: #{current_path}"
    
    visit meal_log_path(meal_log3)
    puts "Current page: #{current_path}"
    
    click_on "See Comments"
    puts "Current page: #{current_path}\n"
    
  end
  
  test "specific meal_log page shows delete and edit button only for the user that posted the log" do
    user = login_user
    meal_log1 = FactoryBot.create :meal_log, user: user
    meal_log2 = FactoryBot.create :meal_log, user: user
    meal_log3 = FactoryBot.create :meal_log
    
    puts "=== Debug Information ==="
    puts "User1: #{user.name}"
    puts "Meal Log 1: #{meal_log1.user.name}"
    puts "Meal Log 2: #{meal_log2.user.name}"
    puts "Meal Log 3: #{meal_log3.user.name}"
  
    visit meal_log_path(meal_log1)
    
    puts "Current page: #{current_path}"
    
    assert_text "Edit"
    assert_text "Delete Log"
    
    click_on "Back to All Logs"
    
    puts "Current page: #{current_path}"
    
    visit meal_log_path(meal_log3)
    
    puts "Current page: #{current_path}\n"
    
    refute page.has_content?("Edit")
    refute page.has_content?("Delete Log")
  
  end
  
  test "create a new meal_log" do
    user = login_user
    
    visit meal_logs_path
    
    click_on "New Meal Log"

    puts "Current page: #{current_path}"
    
    fill_in "Eat date", with: Time.zone.now-1.day
    fill_in "Meal name", with: "test"
    fill_in "Calorie", with: "50"
    fill_in "Meal description", with: "This is test"
    
    click_button "Create Meal Log"
    
    assert_equal page.current_path, meal_logs_path
    puts "Current page: #{current_path}"
    
    assert_text "This is test"

  end
  
  test "update a meal_log" do
    user = login_user
    meal_log = FactoryBot.create :meal_log, user: user
    
    visit meal_log_path(meal_log)
    puts "Current page: #{current_path}"
    puts "User1: #{user.name}"
    puts "View Meal Log:"
    puts "  #{meal_log.id}"
    puts "  #{meal_log.Meal_name}"
    puts "  #{meal_log.Calorie}"
    puts "  #{meal_log.user.name}"
    puts "  #{meal_log.category.name}\n"
    
    click_on "Edit Log"
    
    fill_in "Meal name", with: "Changed"
    
    click_button "Update Meal Log"
    
    meal_log.reload
    
    assert_equal page.current_path, meal_log_path(meal_log)
    
    assert_text "Meal log updated."
    assert_text "Changed"
    
    puts "View Meal Log:"
    puts "  #{meal_log.id}"
    puts "  #{meal_log.Meal_name}"
    puts "  #{meal_log.Calorie}"
    puts "  #{meal_log.user.name}"
    puts "  #{meal_log.category.name}\n"
    
  end
  
  test "delete a meal_log" do
    user = login_user
    meal_log = FactoryBot.create :meal_log, user: user
    
    visit meal_log_path(meal_log)
    puts "Current page: #{current_path}"
    puts "User1: #{user.name}"
    puts "View Meal Log:"
    puts "  #{meal_log.id}"
    puts "  #{meal_log.Meal_name}\n"
    
    click_on "Delete Log"
    
    click_button "Yes"
    
    assert_equal page.current_path, meal_logs_path
    
    assert_text "Meal log deleted."
    refute page.has_content?(meal_log.Meal_name)
    
  end
  
  
  
end
