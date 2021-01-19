# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :account, only: [:show, :update], controller: :account do
        collection do
          get 'latest_tweets'
        end
      end
    end
  end

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
             },
             controllers: {
               sessions: 'api/v1/sessions'
             },
             defaults: { format: :jsonapi }
end
