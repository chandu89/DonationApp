require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  describe '#email' do
    it 'should return error with blank email' do
      record = User.new
      record.valid? # run validations
      expect(record.errors[:email]).to eq(["can't be blank"])
    end
    it 'should return true with valid Bio' do
      expect(user.email).to be_truthy
    end
  end

  describe '#password' do
    it 'should return error with blank password' do
      record = User.new
      record.valid? # run validations
      expect(record.errors[:password]).to eq(["can't be blank"])
    end
    it 'should return true with valid Bio' do
      expect(user.password).to be_truthy
    end
  end
end
