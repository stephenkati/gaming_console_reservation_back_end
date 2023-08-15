class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource
      sign_in(resource)
      token = resource.authentication_token
      render json: { user: resource, token: token }, status: :ok
    else
      render json: {error: 'Invalid credentials'},status: :unauthorized
    end
  end

  protected

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end
end
