class Api::V1::TwitterHandlesController < ApplicationController
  def show
    @tweets = TwitterHandlesActions::Show.call(user: current_user, params: permitted_params).tweets
  end

  def index
    @twitter_handles = TwitterHandle.all
  end

  private

  def permitted_params
    params.permit(:id, :limit)
  end
end
