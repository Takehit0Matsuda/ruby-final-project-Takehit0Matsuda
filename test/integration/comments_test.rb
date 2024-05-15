require "test_helper"

class CommentsTest < ActionDispatch::IntegrationTest
    test "create a comment" do
    user = login_user
    meal_log1 = FactoryBot.create :meal_log, user: user
    
    visit meal_logs_path
    
    assert_text meal_log1.Meal_name
    
    visit meal_log_path(meal_log1)
    click_on "See Comments"
    
    click_on "New Comment"
    
    fill_in "Title", with: "Comment1"
    fill_in "Rate", with: "5"
    fill_in "Comment body", with: "Nice"
    
    click_button "Create Comment"
    
    new_comment_id = Comment.last.id
    assert_equal current_path, meal_log_comment_path(meal_log1, new_comment_id)
    
    assert_text "Comment posted."
    assert_text "Comment1"
    
    click_on "Back to All Comments"
    assert_text "Comment1"
    
  end
  
  test "edit a comment" do
    user = login_user
    meal_log1 = FactoryBot.create :meal_log, user: user
    comment1 = FactoryBot.create :comment, meal_log: meal_log1
    
    visit meal_log_comment_path(meal_log1, comment1)
    
    assert_text comment1.title
    
    puts "\n#{comment1.id}"
    puts "#{comment1.title}"
    puts "#{comment1.rate}"
    puts "#{comment1.comment_body}\n"
    
    click_on "Edit Comment"
    
    fill_in "Title", with: "Updated"
    
    click_button "Update Comment"
    
    assert_equal current_path, meal_log_comment_path(meal_log1, comment1)
    
    assert_text "Comment updated."
    assert_text "Updated"
    refute page.has_content?(comment1.title)
    
    comment1.reload
    
    puts "#{comment1.id}"
    puts "#{comment1.title}"
    puts "#{comment1.rate}"
    puts "#{comment1.comment_body}\n"
    
  end
  
  test "delete a comment" do
    user = login_user
    meal_log1 = FactoryBot.create :meal_log, user: user
    comment1 = FactoryBot.create :comment, meal_log: meal_log1
    
    visit meal_log_comment_path(meal_log1, comment1)
    
    assert_text comment1.title
    
    puts "\n#{comment1.id}"
    puts "#{comment1.title}"
    puts "#{comment1.rate}"
    puts "#{comment1.comment_body}\n"
    
    click_on "Delete Comment"
    
    click_on "Yes"
    
    assert_equal current_path, meal_log_comments_path(meal_log1)
    
    assert_text "Comment deleted."
    refute page.has_content?(comment1.id)
   
  end
  
end
