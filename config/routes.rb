# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cards, only: :destroy do
    collection do
      get :top
      post :create_or_update
    end
  end

  root to: 'cards#top'
end
