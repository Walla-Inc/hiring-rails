class Api::V1::TwitterHandlesController < ApplicationController
  def index
    @twitter_users = User.with_twitter_handles

    if @twitter_users.empty?
      render json: { message: 'No twitter handles' },
        status: :unprocessable_entity
    end
  end
end
