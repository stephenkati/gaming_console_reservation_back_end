require 'rails_helper'

RSpec.describe Console, type: :model do
  describe 'validations' do
    let(:console) { create(:console) }

    it 'should be valid with correct params' do
      expect(console).to be_valid
    end

    it 'should be invalid without a name' do
      console.name = nil
      expect(console).to be_invalid
    end

    it 'should be invalid without a purchase price' do
      console.purchase_price = nil
      expect(console).to be_invalid
    end

    it 'should be invalid without a rental price' do
      console.rental_price = nil
      expect(console).to be_invalid
    end

    it 'should be invalid without a description' do
      console.description = nil
      expect(console).to be_invalid
    end

    it 'should be invalid without a photo' do
      console.photo = nil
      expect(console).to be_invalid
    end

    it 'should be invalid if invalid if purchase price is not an integer' do
      console.purchase_price = 'abc'
      expect(console).to be_invalid
    end

    it 'should be invalid if invalid if rental price is not an integer' do
      console.rental_price = 'abc'
      expect(console).to be_invalid
    end

    it 'should be invalid if invalid if purchase price is less than 0' do
      console.purchase_price = -1
      expect(console).to be_invalid
    end

    it 'should be invalid if invalid if rental price is less than 0' do
      console.rental_price = -1
      expect(console).to be_invalid
    end
  end
end
