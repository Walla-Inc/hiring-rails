require 'rails_helper'
#require 'webmock/rspec'

RSpec.describe "Api::V1::TwitterHandlesController", type: :request do
  let(:user) {  FactoryBot.create(:user) }
  let(:twitter_handle) { FactoryBot.create(:twitter_handle, user: user) }
  let(:auth_headers) {
    Devise::JWT::TestHelpers.auth_headers({ 'Accept' => 'application/json', 'Content-Type' => 'application/json' }, user)
  }
  
  it 'GET #index' do
    get api_v1_twitter_handles_path, headers: auth_headers
    expect(response).to have_http_status(:ok)
  end

  it 'GET #show' do
    # stub_request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?count&screen_name=oystersauce8").to_return(status: 200, body: "[]", headers: {})
    get api_v1_twitter_handle_path(id: twitter_handle.id), headers: auth_headers
    expect(response).to have_http_status(:ok)
  end

  it 'GET #show with limit' do
    #stub_request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?count=1&screen_name=oystersauce8").to_return(status: 200, body: '{}')
    get api_v1_twitter_handle_path(id: twitter_handle.id, limit: 1), headers: auth_headers
    expect(response).to have_http_status(:ok)
  end

end
