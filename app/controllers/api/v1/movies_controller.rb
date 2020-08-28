class Api::V1::MoviesController < ApplicationController

    def index 
        # GET ALL MOVIES ORDERED FROM MOST RECENT TO OLDEST
        movies = Movie.order('created_at')
        render json: {
            movies: MovieSerializer.new(movies)
        }
    end

    def create 
        # HANDLING ADDING A MOVIE TO A USERS NOMINATIONS
        if params[:user_id]
            user = User.find(params[:user_id])
            if user&.movies.length >= 5
                render json: {
                    message: "You can only nominate 5 movies"
                }
            else
                movie = user.movies.build(movie_params)
                if movie.save 
                    render json: {
                        movie: MovieSerializer.new(movie),
                        message: "Movie nominated successfully",
                    }
                end
            end
        end
    end

    def destroy 
        if params[:user_id]
            user = User.find(params[:user_id])
            movie = user.movies.find(params[:id])
            if movie.destroy
                render json: {
                    movie: MovieSerializer.new(movie).serializable_hash,
                    message: "Movie removed from nomination list"
                }
            end
        end
    end

    # Users can search for movies
    # Users can nominate movies 
    # Users can delete movies from the nomination list
    # Users can review nomination list

    private 

    def movie_params
        # SHOWS PERMITTED PARAMS FOR A MOVIE 
        params.permit(:title, :release_year, :plot, :poster)
    end

end
