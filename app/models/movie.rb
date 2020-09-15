class Movie < ApplicationRecord
    validates :title, :release_year, :plot, presence: true

    has_many :favorited_movies, dependent: :destroy
    has_many :users, through: :favorited_movies, dependent: :destroy
    belongs_to :user, optional: true
end
