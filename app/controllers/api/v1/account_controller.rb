class Api::V1::AccountController < ApplicationController
  def show
  end

  def update
    @resource = UserActions::Update.call(user: current_user, params: permitted_params).resource
  end

  def retrieve_tweets
    @tweets = User.retrieve_tweets(tweet_params[:twitter_handle], tweet_params[:tweets].presence || 10)
  end

  def twitter_handles
    @users = User.all
  end

  private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone_number)
  end

  def  tweet_params
    params.require(:account).permit(:twitter_handle, :tweets)
  end
end
