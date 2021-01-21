require "rails_helper"

RSpec.describe User, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
    it { is_expected.to respond_to(:bio) }
    it { is_expected.to respond_to(:phone_number) }
    it { is_expected.to respond_to(:encrypted_password) }
    it { is_expected.to respond_to(:reset_password_token) }
    it { is_expected.to respond_to(:reset_password_sent_at) }
    it { is_expected.to respond_to(:remember_created_at) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
    it { is_expected.to respond_to(:twitter_handle) }
    it { is_expected.to respond_to(:twitter_fetched_count) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe 'scopes' do
    it { expect(User.with_twitter_handles.to_sql).to eq \
      User.where.not(twitter_handle: nil).to_sql
    }
  end
end
