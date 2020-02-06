Rails.application.routes.draw do
  resources :cards, only: [:create, :destroy] do
    collection do
      get :top
    end
  end
end

