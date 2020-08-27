class Api::V1::UsersController < ApplicationController

    def index 
        users = User.order('created_at')
        render json: {
            users: UserSerializer.new(users).serializable_hash
        }
    end

    def show 
        user = User.find(params[:id])
        render json: {
            user: UserSerializer.new(user),
            message: "We found #{user.username}"
        }
    end

end
