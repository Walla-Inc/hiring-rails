require "rails_helper"

RSpec.describe Api::V1::TwitterHandlesController, type: :controller do
  let(:user) { create(:user) }

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
