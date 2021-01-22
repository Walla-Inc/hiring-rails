module TwitterHandlesActions
  class Show
    include Interactor

    def call
      params = context.params
      user   = context.user
      context.twitter_handle = user.twitter_handles.find_by_id(params[:id])
      context.tweets = context.twitter_handle.tweets(limit: params[:limit])
      TwitterHandle.increment_counter(:fetch_count, context.twitter_handle.id)
    end

  end
end
