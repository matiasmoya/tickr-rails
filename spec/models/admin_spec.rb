require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { create(:admin) }

  subject { admin }

  describe "Validations" do
    it { should respond_to(:email) }
  end

  describe "Factory" do
    it "creates a valid admin" do
      expect(admin).to be_valid
    end
  end
end
