class SessionsController < ApplicationController
    # before_action :current_user, only: [:logged_in]

    def login
        # HANDLES LOGGING IN USER 
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

    # NEEDS FIXING
    def logged_in
        if @current_user
            render json: {
                logged_in: true,
                user: {
                    id: @current_user.id,
                    username: @current_user.username,
                    email: @current_user.email,
                    image: @current_user.image,
                    movies: @current_user.movies
                }
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logout 
        # HANDLE LOGGING USER OUT 
        session.clear
        render json: {
            status: 200,
            logged_in: false,
            logged_out: true
        }
    end

end
