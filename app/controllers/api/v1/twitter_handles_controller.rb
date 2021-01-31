class Api::V1::TwitterHandlesController < ApplicationController
  def index
    render json: User.all.map { |u| { twitter_handle: u.twitter_handle, tweets_fetched_count: u.tweets_fetched_count } }
  end
end
