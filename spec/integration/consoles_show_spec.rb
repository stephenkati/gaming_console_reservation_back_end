require 'swagger_helper'
# rubocop:disable Metrics/BlockLength
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

  path '/api/v1/consoles/{id}' do
    get 'Retrieves a console' do
      tags 'Consoles'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', 'console found' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string },
                 data: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     name: { type: :string },
                     purchase_price: { type: :number },
                     rental_price: { type: :number },
                     description: { type: :string },
                     photo: { type: :string }
                   },
                   required: %w[id name purchase_price rental_price description photo]
                 }
               },
               required: %w[status message data]

        let(:Authorization) { @auth }
        let(:id) do
          Console.create(
            name: 'Playstation 5',
            purchase_price: 10_000,
            rental_price: 100,
            description: 'Playstation 5',
            photo: 'photo url'
          ).id
        end

        run_test!
      end

      response '404', 'console not found' do
        let(:Authorization) { @auth }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
