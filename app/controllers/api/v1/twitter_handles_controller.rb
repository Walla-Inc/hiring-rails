class Api::V1::TwitterHandlesController < ApplicationController
  def index
    render json: User.all.as_json(only: [:tweets_fetched_count, :twitter_handle])
  end
end
