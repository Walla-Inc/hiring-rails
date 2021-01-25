json.array! @twitter_handles do |handle|
  json.twitter_handle handle.twitter_handle
  json.number_of_access handle.number_of_access
end