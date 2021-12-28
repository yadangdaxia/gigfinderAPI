Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # For login action, verb needs to be post
      post '/login', to: 'users#login'
    end
  end
end
