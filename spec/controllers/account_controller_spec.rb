require 'rails_helper'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

RSpec.describe Api::V1::AccountController do
  describe "GET #latest_tweets" do
    before do
      user = FactoryBot.create(:user)
      sign_in user
      get 'latest_tweets'
    end
    it "returns http success" do
      expect(JSON.parse(response.body)['status']).to be(200)
    end

    it "has 10 results" do
      expect(JSON.parse(response.body)['data'].size).to be(10)
    end
  end

  describe "GET #latest_tweets count is 25" do
    before do
      user = FactoryBot.create(:user)
      sign_in user
      get 'latest_tweets', params: {count: 25}
    end
    it "returns http success" do
      expect(JSON.parse(response.body)['status']).to be(200)
    end

    it "has 25 results" do
      expect(JSON.parse(response.body)['data'].size).to be(25)
    end
  end

  describe "GET #latest_tweets time_fetched increases" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it "user has 0 time_fetched" do
      expect(@user.time_fetched).to be(0)
    end

    it "has 25 results" do
      get 'latest_tweets'
      expect(User.find(@user.id).time_fetched).to be(1)
    end
  end

  describe "GET #usage_data" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      get 'usage_data'
      @body = JSON.parse(response.body)
    end
    it "returns http success" do
      expect(@body['status']).to be(200)
    end

    it "has at least 0" do
      expect(@body['data'].size).to be >= 0
    end

    it "has at time_fetched key" do
      record = JSON.parse(@body['data']).first
      expect(record.key?('time_fetched')).to be(true)
    end

    it "has at twitter_handle key" do
      record = JSON.parse(@body['data']).first
      expect(record.key?('twitter_handle')).to be(true)
    end
  end
end
