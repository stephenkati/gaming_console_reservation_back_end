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

  path '/api/v1/consoles/{id}' do
    delete 'Deletes a console' do
      tags 'Consoles'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, type: :string
      parameter name: :id, in: :path, type: :integer

      response '200', 'console deleted' do
        let(:Authorization) { @auth }
        let(:id) do
          console = Console.create(
            name: 'Playstation 5',
            purchase_price: 10_000,
            rental_price: 100,
            description: 'Playstation 5',
            photo: 'photo url'
          )
          console.id
        end

        run_test!
      end

      response '404', 'console not found' do
        let(:Authorization) { @auth }
        let(:id) { -1 }

        run_test!
      end
    end
  end
end
