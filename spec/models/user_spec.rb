require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }

    it 'should be valid with correct params' do
      expect(user).to be_valid
    end

    it 'should be invalid without a username' do
      user.username = nil
      expect(user).to be_invalid
    end

    it 'should be invalid without an email' do
      user.email = nil
      expect(user).to be_invalid
    end
  end
end
