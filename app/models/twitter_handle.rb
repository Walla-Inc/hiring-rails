class TwitterHandle < ApplicationRecord
  belongs_to :user

  def tweets(limit: 10)
    twitter_client.user_timeline(twitter_handle, count: limit).map {|item| item.text }
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end
