class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  def create
     self.resource = User.find_for_database_authentication(username: params[:username])
    if resource && resource.valid_password?(params[:password])
      sign_in(resource)
      token = resource.authentication_token
      render json: { user: resource, token: }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  protected

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end
end
