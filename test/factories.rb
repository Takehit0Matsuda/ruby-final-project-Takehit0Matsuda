FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User#{n}" }
        f.sequence(:email) { |n| "test#{n}@account.com" }
        f.password { "password" }
        f.password_confirmation { |d| d.password }
    end
    
    factory :category do |f|
        f.sequence(:name) { |n| "Test Category #{n}" }
    end
    
    factory :meal_log do |f|
        f.Eat_date { Time.zone.now-1.day }
        f.Calorie { 500 }
        f.sequence(:Meal_name) { |n| "Log#{n}" }
        f.association :category
        f.association :user
    end
    
    factory :comment do |f|
        f.sequence(:title) { |n| "Log#{n}" }
        f.rate { 10 }
        f.comment_body {"Test"}
        f.association :meal_log
    end
    
end