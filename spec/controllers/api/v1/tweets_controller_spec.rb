require 'rails_helper'

describe Api::V1::TweetsController, type: :controller do
  render_views

  let(:user) { FactoryBot.create :user }
  let(:parsed_body) { JSON.parse response.body }

  describe '#index' do
    before do
      sign_in_as user
    end

    context 'when the current user doesn\'t have the twitter handle' do
      before do
        user.update(twitter_handle: nil)

        get :index, as: :json
      end

      it 'returns unprocessable entity error' do
        expect(response).to have_http_status :unprocessable_entity
        expect(parsed_body['message']).to(
          eq 'Twitter handle doesn\'t exist'
        )
      end
    end

    context 'when the current user\'s twitter handle is invalid' do
      before do
        user.update(twitter_handle: 'invalid handle')

        get :index, as: :json
      end

      it 'returns unprocessable entity error' do
        expect(response).to have_http_status :unprocessable_entity
        expect(parsed_body['message']).to(
          eq 'Invalid twitter handle'
        )
      end
    end

    context 'with the valid twitter handle' do
      before do
        user.update(twitter_handle: 'valid handle')
      end

      it 'returns the tweets' do
        tweet = double

        allow(tweet).to receive(:id).and_return(1)
        allow(tweet).to receive(:text).and_return('tweet')

        allow_any_instance_of(Twitter::REST::Client).to \
          receive(:user_timeline).and_return( [tweet] )

        get :index, format: :json

        expect(parsed_body).to eq \
          [
            {
              'id' => 1,
              'content' => 'tweet'
            }
          ]
      end

      context 'without tweets count param' do
        it 'fetches the last 10 tweets' do
          expect_any_instance_of(Twitter::REST::Client).to \
            receive(:user_timeline).with(
              user.twitter_handle,
              count: 10
            )

          get :index, as: :json
        end
      end

      context 'with the wrong type of tweets count param' do
        it 'fetches the last 10 tweets' do
          expect_any_instance_of(Twitter::REST::Client).to \
            receive(:user_timeline).with(
              user.twitter_handle,
              count: 10
            )

          get :index, params: { count: 'abc' }, as: :json
        end
      end

      context 'with the valid tweets count param' do
        it 'fetches the last number of tweets' do
          expect_any_instance_of(Twitter::REST::Client).to \
            receive(:user_timeline).with(
              user.twitter_handle,
              count: 30
            )

          get :index, params: { count: 30 }, as: :json
        end
      end

      context 'when the tweets fetched successfully' do
        before do
          allow_any_instance_of(Twitter::REST::Client).to \
            receive(:user_timeline)
        end

        it 'the current user\'s tweets count increased' do
          expect { get :index, as: :json }.to \
            change {user.twitter_fetched_count}.by(1)
        end
      end
    end
  end
end
