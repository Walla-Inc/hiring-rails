class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  def self.retrieve_tweets(twitter_handle, tweets)
    user = User.find_by(twitter_handle: twitter_handle)
    user.update(fetched_times: user.fetched_times + 1) if user
    TwitterService.new.retrieve_tweets(twitter_handle, tweets)
  end
end
