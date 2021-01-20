module TwitterClient
  Client = Twitter::REST::Client.new do |config|
    config.consumer_key    = Rails.application.credentials.dig(:twitter, :api_key)
    config.consumer_secret = Rails.application.credentials.dig(:twitter, :api_secret_key)
    config.bearer_token    = Rails.application.credentials.dig(:twitter, :bearer_token)
  end
end
