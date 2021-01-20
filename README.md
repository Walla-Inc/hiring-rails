# README

## Candidate instructions
- Review the existing source code and take note of patterns that are in use.
- Create a migration to store a twitter handle on the user model.
- Create an API endpoint that takes the ID of the twitter_handle and returns the last 10 tweets using provided twitter gem.
- Includes rspec tests for the new requests.
  
## Bonus
- Make the number of tweets returned depend on a query param.
- Create an api to return all twitter handles and the number of times we've fetched their data.

## Addendum
### To test signin
- Create your user via Rails console
- `User.create(email: 'test@hellowalla.com', password: 'test', password_confirmation: 'test', first_name: 'Test', last_name: 'User')`
- Test authentication via curl
- `curl -X POST "http://localhost:3000/login" -H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' -d "user[email]=test@hellowalla.com&user[password]=test"`
- Response Authorization header will include JWT token. For example: `Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidX`

## Marcus Addition
### Configuration
- You need to add a Twitter consumer key and secret to the ENV vars: TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET
- I've added the figaro gem so create file  /config/application.yml
- Example line "TWITTER_CONSUMER_KEY: exampleKey4325235"
- Alternatively, add the two constants to your system env vars manually

### Notes
- RSpec testing found in /spec/account_controller_spec.rb. You can run the tests from there. Please be sure to set up the ENV Vars for Twitter
- Two endpoints are /latest_tweets & /usage_data. Latest tweets takes optional param of :count which adjusts how many tweets will return
- /latest_tweets will also only use the handle of the user that is signed in so be sure to use either Twitter ID or public handle when creating User account
- /latest_tweets will keep track of how many times the endpoint was used for the sign in user by incrementing the attribute in the table for the user
