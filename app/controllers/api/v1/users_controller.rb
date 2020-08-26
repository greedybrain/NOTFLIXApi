class Api::V1::UsersController < ApplicationController

    def index 
        users = User.all.order('created_at')
        render json: {
            users: UserSerializer.new(users).serializable_hash
        }
    end

    # Users can search for movies
    # Users can nominate movies 
    # Users can delete movies from the nomination list
    # Users can review nomination list

end
