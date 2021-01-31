class Api::V1::Account::TweetsController < Api::V1::AccountController
  before_action :find_account

  def index
    @account = User.find(params[:account_id])
    @tweets = $twitter_client.user_timeline(@account.twitter_handle, { count: params[:count] || 10 })
    @account.increment!(:tweets_fetched_count)
    render json: @tweets
  end
end
