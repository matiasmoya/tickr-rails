require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let!(:ticket) { create(:ticket) }

  subject { ticket }

  describe "Validations" do
    it { should respond_to(:subject) }
    it { should respond_to(:content) }
    it { should respond_to(:user) }
    it { should respond_to(:admin) }
    it { should respond_to(:ticket_messages) }
    it { should respond_to(:unclaimed?) }
  end

  describe "Factory" do
    it "creates a valid ticket" do
      expect(ticket).to be_valid
    end
  end
end
