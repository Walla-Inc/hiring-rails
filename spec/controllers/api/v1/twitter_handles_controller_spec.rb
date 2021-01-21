require 'rails_helper'

describe Api::V1::TwitterHandlesController, type: :controller do
  render_views

  let(:user) { FactoryBot.create :user }
  let(:parsed_body) { JSON.parse response.body }

  describe '#index' do
    before do
      sign_in_as user
    end

    context 'when twitter users don\'t exist' do
      before do
        user.update(twitter_handle: nil)

        get :index, as: :json
      end

      it 'returns unprocessable entity error' do
        expect(response).to have_http_status :unprocessable_entity
        expect(parsed_body['message']).to(
          eq 'No twitter handles'
        )
      end
    end

    context 'when twitter users exist' do
      before do
        user.update(twitter_handle: 'valid handle')

        get :index, as: :json
      end

      it 'returns the twitter handle and tweets count' do
        expect(response).to be_successful
        expect(parsed_body).to eq \
          [
            {
              'twitter_handle' => 'valid handle',
              'twitter_fetched_count' => 0
            }
          ]
      end
    end
  end
end
