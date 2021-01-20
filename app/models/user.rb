class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  def tweets(count = 20)
    increment!(:twitter_fetch_count)
    tweets = TwitterClient::Client.user_timeline twitter_handle, count: count
    tweets.map { |tweet| { text: tweet.text } }
  end
end
