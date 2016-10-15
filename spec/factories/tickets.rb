FactoryGirl.define do
  factory :ticket do
    user
    admin nil
    subject "Ticket for testing"
    status "pending"
    content "This is a ticket for testing"
  end
end
