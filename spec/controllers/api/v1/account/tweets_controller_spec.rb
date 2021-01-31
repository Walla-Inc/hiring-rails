require "rails_helper"

RSpec.describe Api::V1::Account::TweetsController, type: :controller do
  let(:user) { create(:user) }

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
