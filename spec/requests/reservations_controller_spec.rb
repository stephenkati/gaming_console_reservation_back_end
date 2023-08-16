require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  describe '#index' do
    it 'returns a list of reservations' do
      user = create(:user)
      create_list(:reservation, 4, user: user)
      
      auth_headers = user.create_new_auth_token
      
      get api_v1_reservations_path, headers: auth_headers

      expect(response).to have_http_status(:ok)

      response_json = JSON.parse(response.body)
      expect(response_json).to be_an(Array)
      expect(response_json.length).to eq(4)
    end
  end
end
