class Api::V1::MoviesController < ApplicationController

    def index 
        # GET ALL MOVIES ORDERED FROM MOST RECENT TO OLDEST
        if params[:user_id]
            user = User.find(params[:user_id])
            movies = user.movies.order('created_at DESC')
            render json: {
                movies: MovieSerializer.new(movies)
            }
        else
            movies = Movie.order('created_at DESC')
            render json: {
                movies: MovieSerializer.new(movies)
            }
        end
    end

    def add_movie_to_home 
        movie = Movie.find_or_create_by(plot: params[:plot]) do |movie|
            movie.title = params[:title]
            movie.actors = params[:actors]
            movie.genre = params[:genre]
            movie.language = params[:language]
            movie.country = params[:country]
            movie.runtime = params[:runtime]
            movie.release_year = params[:release_year]
            movie.poster = params[:poster]
            movie.imdb_rating = params[:imdb_rating]
            movie.production = params[:production]
        end
        if movie.save
            render json: {
                movie: MovieSerializer.new(movie).serializable_hash
            } 
        else
            render json: {
                status: 204,
                message: "We couldn't find that movie"
            } 
        end
    end

    def create 
        # HANDLING ADDING A MOVIE TO A USERS NOMINATIONS
        if params[:user_id]
            user = User.find(params[:user_id])
            if user.movie_limit_reached?
                render json: {
                    user_movies: MovieSerializer.new(user.movies).serializable_hash,
                    warning: "You can only nominate 5 movies"
                }
            else
                movie = Movie.find_by(plot: params[:plot])
                if movie
                    user.favorited_movies << movie.id
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
            movie = user.favorited_movies.find_by(id: params[:movie_id])
            binding.pry
            if movie.destroy
                render json: {
                    message: "Movie removed from nomination list"
                }
            end
        end
    end

    private 

    def movie_result_params 
        params.permit(:title, :actors, :genre, :language, :country, :runtime, :plot, :poster,  :release_year, :imdb_rating, :production, :user_id)
    end

end
