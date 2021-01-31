# $twitter_client = Twitter::REST::Client.new do |config|
#   config.consumer_key = Rails.application.credentials.twitter_cosumer_key
#   config.consumer_secret = Rails.application.credentials.twitter_consumer_secret
#   config.access_token = Rails.application.credentials.twitter_accesss_token
#   config.access_token_secret = Rails.application.credentials.twitter_access_token_secret
# end

$twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key = "KRdHUvpDAUNi7xj1F02ZRzbDA"
  config.consumer_secret = "WnRCiiHsxxLSO7Myz8XNnv9I71tQNB9msRzU3phSI6xPxrR00e"
  config.access_token = "39341559-A8le7PHopxXhYJOYpLJhyzO5N4zZU5unutZxmS0wo"
  config.access_token_secret = "628VrTHZgDPdk91z8exW6roKzHy0uHWmbzGSAbDZww2Kj"
end
