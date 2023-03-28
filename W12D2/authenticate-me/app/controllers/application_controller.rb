class ApplicationController < ActionController::API

  protect_from_forgery with: :exception
  before_action :snake_case_params, :attach_authenticity_token

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def login!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end
  
  def ensure_logged_in
    unless logged_in?
      render json: { message: 'Must be logged in' }, status: :unauthorized
    end
  end

  def ensure_logged_out
    if logged_in?
      render json: { message: 'Must be logged out' }, status: :unauthorized
    end
  end

  def logged_in?
    !!current_user
  end

  def test
    if params.has_key?(:login)
      login!(User.first)
    elsif params.has_key?(:logout)
      logout!
    end
  
    if current_user
      render json: { user: current_user.slice('id', 'username', 'session_token') }
    else
      render json: ['No current user']
    end
  end

  private

  def snake_case_params
    params.deep_transform_keys!(&:underscore)
  end

  def attach_authenticity_token
    
  end

end