require 'rails_helper'

RSpec.describe Bio, type: :model do
  let(:bio) { FactoryGirl.create(:bio) }

  describe '#Bio' do
    it 'should return error with blank Bio' do
      record = Bio.new
      record.valid? # run validations
      expect(record.errors[:Bio]).to eq(["can't be blank"])
    end
    it 'should return true with valid Bio' do
      expect(bio.Bio).to be_truthy
    end
  end
end
