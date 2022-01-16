Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # namespace command used to differentiate versions
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :users, only: [:index, :show, :update, :create] do
        resources :talent_bookmarks, only: [:create]
      end

      resources :gigs, only: [:index, :show, :create, :update, :destroy] do
        resources :inquiries, only: [:create]
      end
      resources :inquiries, only: [:index]

      # For login action, verb needs to be post

      # resources :users, only: [:index, :show]
      # TO DO: Can continue with customize action
      post '/login', to: 'users#login'

      resources :categories
    end
  end
end
