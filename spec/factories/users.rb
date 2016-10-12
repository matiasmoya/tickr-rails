FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user_#{n}@demo.com"
    end

    password "testpassword"
    password_confirmation "testpassword"
  end
end
