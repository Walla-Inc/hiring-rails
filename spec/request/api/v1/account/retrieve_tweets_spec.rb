require "rails_helper"
require 'devise/jwt/test_helpers'

RSpec.describe "Retrieve Tweets", :type => :request do

  it "creates a Widget and redirects to the Widget's page" do
    User.create(email: 'test@hellowalla.com',
                password: 'test',
                password_confirmation: 'test',
                first_name: 'Test',
                last_name: 'User',
                twitter_handle: 'JoeBiden'
              )
    headers = { "ACCEPT" => "application/json" }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, User.first)
    get "/api/v1/account/retrieve_tweets",
      :params => {:account => { :twitter_handle => "JoeBiden"}},
      :headers => auth_headers
    expect(response).to have_http_status(:ok)
  end

end
