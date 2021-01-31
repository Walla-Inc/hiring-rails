require "rails_helper"

RSpec.describe Api::V1::TwitterHandlesController, type: :controller do
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

  it "returns an array of twitter handles with their tweets fetched count" do
    get :index
    expect(response).to be_successful
    json = JSON.parse(response.body)
    expect(json).to be_an_instance_of(Array)
    first_item = json[0]
    expect(first_item).to have_key("tweets_fetched_count")
    expect(first_item).to have_key("twitter_handle")
  end
end
