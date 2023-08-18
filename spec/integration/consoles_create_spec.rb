require 'swagger_helper'

describe 'Console API' do
  before do
    @user = User.find_by(username: 'test')
    if @user.nil?
      @user = User.create(
        username: 'cr7',
        email: 'tha.goat@royalty.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    @auth_headers = @user.create_new_auth_token if @user
    @auth = @auth_headers['Authorization']
  end

  path '/api/v1/consoles' do
    post 'Creates a console' do
      tags 'Consoles'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, type: :string
      parameter name: :console, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          purchase_price: { type: :number },
          rental_price: { type: :number },
          description: { type: :string },
          photo: { type: :string }
        },
        required: %w[name purchase_price rental_price description photo]
      }

      response '200', 'console created' do
        let(:Authorization) { @auth }
        let(:'Content-Type') { 'application/json' }
        let(:console) do
          {
            name: 'Playstation 5',
            purchase_price: 10_000,
            rental_price: 100,
            description: 'Playstation 5',
            photo: 'photo url'
          }
        end

        run_test!
      end

      response '422', 'invalid request' do
        let(:Authorization) { @auth }
        let(:'Content-Type') { 'application/json' }
        let(:console) { { name: 'foo' } }

        run_test!
      end
    end
  end
end
