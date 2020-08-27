class NominationList < ApplicationRecord
  belongs_to :user
  has_many :movies
end
