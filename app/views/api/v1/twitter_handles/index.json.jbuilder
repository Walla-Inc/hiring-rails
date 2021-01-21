json.array! @twitter_users do |user|
  json.twitter_handle user.twitter_handle
  json.twitter_fetched_count user.twitter_fetched_count
end
