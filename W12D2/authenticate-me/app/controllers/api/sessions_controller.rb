class Api::SessionsController < ApplicationController

  before_action :ensure_logged_in, only: [:destroy]
  before_action :ensure_logged_out, only: [:create]

  def show
    @user = current_user
    if @user
      render 'api/users/show'
    else
      render json: { user: nil }
    end
  end

  def create
    email = params[email]
    username = params[username]
    if (email) credential = email
    else credential = username
    password = params[password]
    @user = User::find_by_credentials(credential, password)
    if @user
      login!(@user)
      render 'api/users/show'
    else
      render json: { errors: ['The provided credentials were invalid.'] }, status: unauthorized
    end
  end

  def destroy
    logout!(current_user)
    render json: { message: 'success' }
  end

end