require 'rails_helper'

RSpec.describe Api::V1::ConsolesController, type: :request do
  describe '#index' do
    it 'returns a list of consoles' do
      create_list(:console, 4)
      get api_v1_consoles_path

      response.body
      # puts "body - #{response_body}"
      expect(response.body['data'].length).to eq(4)
      expect(response).to have_http_status(:ok)
    end
  end

  # describe '#show' do
  # end

  # describe '#create' do
  # end

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
