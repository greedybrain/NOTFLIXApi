Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :users do 
        resources :nomination_lists
      end

      get '/logged_in', to: 'sessions#logged_in'
      post '/login', to: 'sessions#login'
      delete '/logout', to: 'sessions#logout'
    end
  end
end
