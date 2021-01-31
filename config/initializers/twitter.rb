$twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key = Rails.application.credentials.twitter_consumer_key
  config.consumer_secret = Rails.application.credentials.twitter_consumer_secret
  config.access_token = Rails.application.credentials.twitter_accesss_token
  config.access_token_secret = Rails.application.credentials.twitter_access_token_secret
end
