require 'swagger_helper'

describe 'Reservations API' do
  before do
    @user = User.find_by(username: 'test')
    if @user.nil?
      @user = User.create(username: 'john', email: 'john@gmail.com', password: 'password',
                          password_confirmation: 'password')
    end
    @user_id = @user.id
    @auth_headers = @user.create_new_auth_token if @user
    @auth = @auth_headers['Authorization']
  end

  path '/api/v1/reservations', headers: @auth do
    post 'create a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          city: { type: :string },
          reserve_date: { type: :string },
          console_id: { type: :integer }
        },
        required: %w[user_id city reserve_date console_id]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          Reservation.create(
            user_id: 1,
            city: 'New York',
            reserve_date: '2023-12-12',
            console_id: 1
          )
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { city: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/reservations', headers: @auth do
    get 'Fetch reservations for a user' do
      tags 'Reservations'
      produces 'application/json'
      let(:user_id) { @user.id }
      parameter name: :user_id, in: :path, type: :string

      response '200', 'reservations found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   user_id: { type: :integer },
                   city: { type: :string },
                   reserve_date: { type: :string },
                   console_id: { type: :integer }
                 },
                 required: %w[id user_id city reserve_date console_id]
               }

        let(:reservation) do
          Reservation.create(
            user_id: 1,
            city: 'New York',
            reserve_date: '2023-12-12',
            console_id: 1
          )
        end
        run_test!
      end
    end
  end
end
