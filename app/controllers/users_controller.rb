class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def api_token
    @user = User.find(params[:id])
    render json: @user.api_token, status: :ok
  end
end
