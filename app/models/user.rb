class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true 
    validates :password, length: { minimum: 8 }
    # Image is optional

    has_many :movies, dependent: :destroy

    def movie_limit_reached?
        self&.movies.length >= 5
    end

    def saved_movies_contain_movie?(movie)
        found_movie = self.movies.find {|mov| mov.title == movie.title}
        binding.pry
        found_movie.nil?
    end

    # f user&.movies.length >= 5
    #             render json: {
    #                 user_movies: MovieSerializer.new(user.movies).serializable_hash,
    #                 message: "You can only nominate 5 movies"
    #             }


end
