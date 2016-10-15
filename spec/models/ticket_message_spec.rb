require 'rails_helper'

RSpec.describe TicketMessage, type: :model do
  let!(:ticket_message) { create(:ticket_message) }

  subject { ticket_message }

  describe "Validations" do
    it { should respond_to(:ticket) }
    it { should respond_to(:user) }
    it { should respond_to(:admin) }
    it { should respond_to(:content) }
  end

  describe "Factory" do
    it "creates a valid ticket message" do
      expect(ticket_message).to be_valid
    end
  end
end
