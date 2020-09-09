class Movie < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, :release_year, :plot, presence: true

    has_many :movie_users, dependent: :destroy
    has_many :users, through: :movie_users, dependent: :destroy
    
end
