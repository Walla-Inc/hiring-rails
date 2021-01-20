class Api::V1::AccountController < ApplicationController
  def show
  end

  def update
    @resource = UserActions::Update.call(user: current_user, params: permitted_params).resource
  end


  # gets the :count(10) latest tweets from the account
  def latest_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
    end

    count = params[:count] || 10
    time_line = client.user_timeline(current_user.twitter_handle, {count: count})
    current_user.update(time_fetched: current_user.time_fetched+1)
    if time_line.class == Twitter::Error::NotFound
      render json: {status: 400, success: false, message: 'Twitter handle or id not valid'}
    else
      render json: {status: 200, success: true, message: 'Success', data: time_line.map{|a| a.text}.as_json}
    end

  rescue => e
    Rails.logger.error "account_controller#latest_tweets - Error: #{e.message}"
    render json: {status: 500, success: false, message: 'Unexpected error'}
  end

  # give a summary of handles and times fetched
  def usage_data
    usage_data = User.all.select(:time_fetched, :twitter_handle).to_json
    render json: {status: 200, success: true, message: 'Success', data: usage_data}
  rescue => e
    Rails.logger.error "account_controller#usage_data - Error: #{e.message}"
    render json: {status: 500, success: false, message: 'Unexpected error'}
  end


  private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone_number)
  end
end
