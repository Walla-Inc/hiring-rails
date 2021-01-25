class Api::V1::AccountController < ApplicationController
  before_action :load_client, only: :tweets

  def show
  end

  def tweets
    begin
      @tweets = @client.user_timeline(params[:twitter_handle], count: params[:number_of_tweets].blank? ? TWEETS_LIMIT : params[:number_of_tweets].to_i)
      User.update_accessibility(params[:twitter_handle])
    rescue => e
      @tweets = []
    end
  end

  def twitter_handles
    @twitter_handles = User.select(:twitter_handle, :number_of_access)
  end

  def update
    @resource = UserActions::Update.call(user: current_user, params: permitted_params).resource
  end

  private

  def load_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone_number, :twitter_handle)
  end
end
