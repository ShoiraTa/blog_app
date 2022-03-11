class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_with_token
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  respond_to :html, :json

  def api_path
    request.original_url.include?('api')
  end

  def authenticate_with_token
    return unless params[:api_token]

    user = User.find_by_api_token(params[:api_token])
    sign_in(user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
