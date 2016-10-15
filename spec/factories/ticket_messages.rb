FactoryGirl.define do
  factory :ticket_message do
    ticket nil
    user nil
    admin nil
    content "MyString"
  end
end
