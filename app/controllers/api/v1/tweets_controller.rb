class Api::V1::TweetsController < ApplicationController
  def index
    if current_user.twitter_handle.present?
      # Check the number of tweets returned
      count = params[:count].to_i
      count = 10 if count.zero?

      # Fetch the last tweets
      client = Twitter::REST::Client.new do |config|
        config.consumer_key    = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
      end

      @tweets = client.user_timeline(
        current_user.twitter_handle, count: count
      )

      # Increase the number of fetched times
      current_user.twitter_fetched_count += 1
      current_user.save
    else
      render json: {
        message: 'Twitter handle doesn\'t exist'
      }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: {
      message: 'Invalid twitter handle'
    }, status: :unprocessable_entity
  end
end
