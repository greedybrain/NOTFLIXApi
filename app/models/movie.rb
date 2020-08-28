class Movie < ApplicationRecord
    belongs_to :user

    validates :title, :release_year, :plot, presence: true
    # poster validations
end
