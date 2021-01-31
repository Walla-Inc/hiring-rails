class Api::V1::Account::TweetsController < Api::V1::AccountController
  def index
    @user = User.find(params[:account_id])
    @tweets = $twitter_client.user_timeline(@user.twitter_handle, { count: params[:count] || 10 })
    render json: @tweets
  end
end
