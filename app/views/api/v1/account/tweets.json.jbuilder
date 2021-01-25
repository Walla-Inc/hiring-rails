json.array! @tweets do |tweet|
  json.body tweet.full_text
end