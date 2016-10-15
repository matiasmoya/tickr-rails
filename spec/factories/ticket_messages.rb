FactoryGirl.define do
  factory :ticket_message do
    ticket
    user
    admin nil
    content "A ticket message"
  end
end
