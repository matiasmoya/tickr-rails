FactoryGirl.define do
  factory :admin do
    sequence :email do |n|
      "admin_#{n}@demo.com"
    end

    password "testpassword"
    password_confirmation "testpassword"
  end
end
