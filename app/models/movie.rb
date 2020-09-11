class Movie < ApplicationRecord
    validates :title, :release_year, :plot, presence: true

    has_many :users
    belongs_to :user, optional: true
end
