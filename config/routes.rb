Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # namespace command used to differentiate versions
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Added create to the routes - 1/10/2022-AM
      resources :users, only: [:index, :create, :show, :update] do
        # Nested because you must be a user to make a gig / make inquiries
        resources :gigs, only: [:create, :edit, :destroy]

        # resources :inquiries, shallow: true
      end
      resources :gigs, only: [:index, :show]
      # For login action, verb needs to be post

      # resources :users, only: [:index, :show]
      # TO DO: Can continue with customize action
      post '/login', to: 'users#login'

      resources :categories
    end
  end
end
