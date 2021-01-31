require "rails_helper"

RSpec.describe Api::V1::Account::TweetsController, type: :controller do
  let(:email) { "test@hellowalla.com" }
  let(:password) { "password" }
  let(:password_confirmation) { "password" }
  let(:first_name) { "Test" }
  let(:last_name) { "User" }
  let(:twitter_handle) { "planetzolon" }
  let(:user) { User.create(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name, twitter_handle: twitter_handle) }

  before(:each) do
    sign_in user
  end

  it "returns a users tweets" do
    get :index, params: { account_id: 1 }
    expect(response).to be_successful
    expect(JSON.parse(response.body)).to be_an_instance_of(Array)
  end

  it "returns a users tweets limited by param" do
    count = 4
    get :index, params: { account_id: 1, count: count }

    tweets = JSON.parse(response.body)

    expect(response).to be_successful
    expect(tweets.length).to eq(count)
  end

  it "should increment tweets_fetched_count on user" do
    tweets_fetched_count = user.tweets_fetched_count
    get :index, params: { account_id: user.id }
    expect(response).to be_successful
    user.reload
    expect(user.tweets_fetched_count).to eq(tweets_fetched_count + 1)
  end
end
