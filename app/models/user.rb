class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  scope :with_twitter_handles, -> { where.not(twitter_handle: nil) }
end
