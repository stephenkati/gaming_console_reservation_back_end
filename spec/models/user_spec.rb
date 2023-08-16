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

    it 'should be invalid if username is not unique' do
      user2 = build(:user, username: user.username)
      expect(user2).to be_invalid
    end

    it 'should be invalid if email is not unique' do
      user2 = build(:user, email: user.email)
      expect(user2).to be_invalid
    end
  end
end
