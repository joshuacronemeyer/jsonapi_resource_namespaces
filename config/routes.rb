Rails.application.routes.draw do
  namespace :api do
    # namespace :core do
    jsonapi_resources :users, only: [:show] do
      jsonapi_related_resources :credit_cards
      jsonapi_related_resources :addresses
    end
  end
end
