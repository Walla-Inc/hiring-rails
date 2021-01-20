FactoryBot.define do
  factory :user, class: User do
    email {Faker::Internet.email}
    password {'test'}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    twitter_handle {"taylorswift13"}
  end
end
