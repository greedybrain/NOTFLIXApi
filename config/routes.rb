Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do

      resources :users do 
        resources :movies, only: [:index, :create, :destroy]
      end

      resources :movies, only: [:index]
    end
  end

  #SIGNUP
  post '/signup', to: 'registrations#signup'

  # LOGGED IN?/LOGIN/LOGOUT 
  get '/logged_in', to: 'sessions#logged_in'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
end
