class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  def self.update_accessibility twitter_handle
    user = self.where(twitter_handle: twitter_handle).first
    user.increment!(:number_of_access) unless user.nil?
  end
end
