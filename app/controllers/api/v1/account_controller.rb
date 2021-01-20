class Api::V1::AccountController < ApplicationController
  def show

  end

  def update
    @resource = UserActions::Update.call(user: current_user, params: permitted_params).resource
  end

  def tweets
    tweets = User
      .select(:id, :twitter_handle, :twitter_fetch_count)
      .find(params[:id])
      .tweets(params[:count])

    render json: tweets
  end

  def twitter
    accounts = User
      .select(:id, :twitter_handle, :twitter_fetch_count)
      .where.not(twitter_handle: nil)

    render json: accounts
  end

  private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone_number, :twitter_handle)
  end
end
