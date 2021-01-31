class Api::V1::AccountController < ApplicationController
  def show
  end

  def update
    @resource = UserActions::Update.call(user: current_user, params: permitted_params).resource
  end

  private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone_number, :twitter_handle)
  end
end
