FactoryBot.define do
  factory :user do
    email { 'test@hellowalla.com' }
    password { 'test' }
    password_confirmation { 'test' }
    first_name { 'Test' }
    last_name { 'User' }
  end
end
