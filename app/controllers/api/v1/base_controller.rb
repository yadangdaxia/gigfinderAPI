# This file is rescuing us from errors

class Api::V1::BaseController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token


  rescue_from StandardError,                with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def authenticate_user!
    current_user || invalid_authentication
  end
  private

  def invaild_authentication
    render json: { error: { message: "User authentication failed!", code: nil } }, status: :unauthorized
  end

  def current_user
    p "=============================================="
    p request.headers
    user_id = request.headers['X-USER-ID']&.split(' ')&.last.to_i
    @current_user ||= User.find_by(id: user_id) if user_id

  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end
end
