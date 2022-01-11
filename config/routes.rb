Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace command used to differentiate versions
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :create] do
        # Nested because you must be a user to make a gig / make inquiries
        resources :gigs, only: [:create, :update, :destroy]

        # resources :inquiries, shallow: true
      end
      resources :gigs, only: [:index, :show, :create, :update]
      # For login action, verb needs to be post

      # TO DO: Can continue with customize action
      post '/login', to: 'users#login'

      resources :categories
    end
  end
end
