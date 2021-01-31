require "rails_helper"

RSpec.describe User, type: :model do
  it "can have twitter handle" do
    user = User.new
    expect(user.attributes).to include("twitter_handle")
  end
end
