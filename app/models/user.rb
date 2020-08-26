class User < ApplicationRecord
    has_secure_password

    # Username must be present and unique
    # Email must be present and unique
    # Password must contain 8 or more characters
    # Image is optional

    has_one :nomination_list
    has_many :movies, through: :nomination_list
end
