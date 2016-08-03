class Api::UsersController < ApplicationController
skip_before_action :authenticate, only: [:create]

  private

  def build_resource
    @user = User.new resource_params
  end

  def update
    authorize @resource

    super
  end

  def resource
    # @user
    @user = current_user || User.find(params[:id])
  end

  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
