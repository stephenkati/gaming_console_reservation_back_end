require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  describe '#index' do
    it 'returns a list of reservations' do
      user = create(:user)
      create_list(:reservation, 4, user:)

      auth_headers = user.create_new_auth_token

      get api_v1_reservations_path, headers: auth_headers

      expect(response).to have_http_status(:ok)

      response_json = JSON.parse(response.body)
      expect(response_json).to be_an(Array)
      expect(response_json.length).to eq(4)
    end
  end

  describe '#create' do
    let(:user) { create(:user) }
    let(:console) { create(:console) }
    let(:valid_attributes) do
      {
        reservation: {
          reserve_date: Date.today,
          city: 'São Paulo',
          console_id: console.id
        }
      }
    end

    let(:invalid_attributes) do
      {
        reservation: {
          reserve_date: Date.today,
          city: 'São Paulo'
        }
      }
    end

    it 'creates a reservation' do
      auth_headers = user.create_new_auth_token
      post api_v1_reservations_path, params: valid_attributes, headers: auth_headers, as: :json
      expect(response).to have_http_status(:created)
    end

    it 'returns a 422 if the reservation is not created' do
      auth_headers = user.create_new_auth_token
      post api_v1_reservations_path, params: invalid_attributes, headers: auth_headers, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }
    let(:reservation) { create(:reservation, user:) }

    it 'deletes a reservation' do
      auth_headers = user.create_new_auth_token
      delete api_v1_reservation_path(reservation.id), headers: auth_headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns a 404 if the reservation is not found' do
      auth_headers = user.create_new_auth_token
      delete api_v1_reservation_path(999), headers: auth_headers
      expect(response).to have_http_status(:not_found)
    end
  end
end
