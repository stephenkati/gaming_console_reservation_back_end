require 'rails_helper'

RSpec.describe Api::V1::ConsolesController, type: :request do
  describe '#index' do
    it 'returns a list of consoles' do
      create_list(:console, 4)
      get api_v1_consoles_path

      response.body
      expect(response.body['data'].length).to eq(4)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:console) { create(:console) }

    it 'returns a specific console' do
      get api_v1_console_path(console.id)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a 404 if the console is not found' do
      get api_v1_console_path(999)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#create' do
    let(:valid_attributes) do
      {
        console: {
          name: 'Playstation 4',
          purchase_price: 299,
          rental_price: 29,
          description: 'The best console ever',
          photo: 'image url'
        }
      }
    end

    let(:invalid_attributes) do
      {
        console: {
          name: 'Playstation 4',
          purchase_price: 'string'
        }
      }
    end

    it 'creates a console' do
      post api_v1_consoles_path, params: valid_attributes, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns a 422 if the console is not created' do
      post api_v1_consoles_path, params: invalid_attributes, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#delete' do
    let(:console) { create(:console) }

    it 'deletes a console' do
      delete api_v1_console_path(console.id)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a 404 if the console is not found' do
      delete api_v1_console_path(999)
      expect(response).to have_http_status(:not_found)
    end
  end
end
