class Api::V1::MoviesController < ApplicationController

    def index 
        movies = Movie.order('created_at')
        render json: {
            movies: MovieSerializer.new(movies)
        }
    end

    def create 
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

    # Users can search for movies
    # Users can nominate movies 
    # Users can delete movies from the nomination list
    # Users can review nomination list

    private 

    def movie_params 
        params.permit(:title, :release_year, :plot, :poster)
    end

end
