class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true 
    validates :password, length: { minimum: 8 }
    # Image is optional

    has_many :movie_users, dependent: :destroy
    has_many :movies, through: :movie_users, dependent: :destroy

    def movie_limit_reached?
        self&.movies.length >= 5
    end

    # def saved_movies_contain_movie?(movie)
    #     found_movie = self.movies.find {|mov| mov.title == movie.title}
    #     binding.pry
    #     found_movie.nil?
    # end

end
