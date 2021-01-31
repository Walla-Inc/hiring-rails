FactoryBot.define do
  factory :user do
    email { "test@hellowalla.com" }
    password { "password" }
    password_confirmation { "password" }
    first_name { "Test" }
    last_name { "User" }
    twitter_handle { "planetzolon" }
  end
end
