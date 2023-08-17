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
    get 'Retrieves all consoles' do
      tags 'Consoles'
      consumes 'application/json'
      parameter name: 'Authorization', in: :header, type: :string

      response '200', 'consoles found' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string },
                 data: {
                   type: :array,
                   items: {
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
                 }
               },
               required: %w[status message data]

        let(:Authorization) { @auth }
        run_test!
      end
    end
  end
end
