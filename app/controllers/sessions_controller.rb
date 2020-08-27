class SessionsController < ApplicationController

    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password]) 
            session[:user_id] = user.id
            render json: {
                user: UserSerializer.new(user).serializable_hash,
                logged_in: true,
                message: "You're logged in",
                status: :created
            }
        else
            render json: {
                status: 401
            }
        end
    end

    def logged_in
        if current_user 
            render json: {
                logged_in: true,
                user: current_user
            }
        end
    end

    def logout 
        session.clear
        render json: {
            status: 200,
            logged_in: false,
            logged_out: true
        }
    end

    private 

    def user_params 
        params.permit(:user).require(:username, :email, )
    end

end
