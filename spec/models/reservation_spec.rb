require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    let(:reservation) { create(:reservation) }

    it 'should be valid with correct params' do
      expect(reservation).to be_valid
    end

    it 'should be invalid without a city' do
      reservation.city = nil
      expect(reservation).to be_invalid
    end

    it 'should be invalid without a reserve date' do
      reservation.reserve_date = nil
      expect(reservation).to be_invalid
    end
  end
end
