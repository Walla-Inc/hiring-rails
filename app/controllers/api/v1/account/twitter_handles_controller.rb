class Api::V1::Account::TwitterHandlesController < Api::V1::AccountController
  def index
    render json: User.all.map { |u| { twitter_handle: u.twitter_handle, tweets_fetched_count: u.tweets_fetched_count } }
  end
end
