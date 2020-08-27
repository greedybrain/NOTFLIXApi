class RegistrationsController < ApplicationController

    def signup 
        user = User.new(user_params)
        if user.save 
            session[:user_id] = user.id
            render json: {
                user: UserSerializer.new(user).serializable_hash,   
                logged_in: true,
                status: :created
            }
        else 
            render json: {
                status: 401,
                message: "Something went wrong"
            }
        end
    end

    private

    def user_params 
        params.permit(:username, :email, :password, :image)
    end

end
