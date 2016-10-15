FactoryGirl.define do
  factory :ticket do
    user nil
    admin nil
    subject "MyString"
    status "MyString"
    content "MyText"
  end
end
