Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do

      resources :users do 
        resources :favorited_movies, only: %i[index, create,]
        resources :movies, only: [:index, :create, :destroy]
      end

      resources :movies, only: [:index, :show]
      post '/add_movie_home', to: "movies#add_movie_to_home"
    end
  end
  
  #SIGNUP
  post '/signup', to: 'registrations#signup'

  # LOGGED IN?/LOGIN/LOGOUT 
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  get '/logged_in', to: 'sessions#logged_in'
  delete '/logout', to: 'sessions#logout'
end
