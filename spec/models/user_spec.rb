require 'rails_helper'

RSpec.describe User, type: :model do

  FAKE_EMAIL = "FakeEmail@fake.com"
  FAKE_PASSWORD = "FakePassword"
  let (:user) {User.new(email: FAKE_EMAIL, password: FAKE_PASSWORD)}

  describe "attributes" do
    it 'belongs to an organization' do
      user = User.new
      expect(user).to respond_to(:organization)
    end

    it 'sets a default role' do
      user = User.new
      user.set_default_role
    end
  end

  describe "#to_s" do
    it "returns the email" do
      expect(user.to_s).to eq(FAKE_EMAIL)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
  end
end
