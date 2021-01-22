class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :twitter_handles

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
end
