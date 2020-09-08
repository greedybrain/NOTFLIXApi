class Movie < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, :release_year, :plot, presence: true
    
end
