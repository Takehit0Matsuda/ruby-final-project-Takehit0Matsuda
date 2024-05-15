require "test_helper"

class CommentTest < ActionDispatch::IntegrationTest

  test "post a comment" do
    comment = FactoryBot.build :comment
    
    assert comment.valid?
  end
  
  test "requires a title" do
    comment = FactoryBot.build :comment
    comment.title = ""
    
    refute comment.valid?
  end
  
  test "requires a rate" do
    comment = FactoryBot.build :comment
    comment.rate = nil
    
    refute comment.valid?
  end
  
  test "requires a comment body" do
    comment = FactoryBot.build :comment
    comment.comment_body = ""
    
    refute comment.valid?
  end
  
  test "requires a meal_log" do
    comment = FactoryBot.build :comment
    comment.meal_log = nil
    
    refute comment.valid?
  end
  
end
