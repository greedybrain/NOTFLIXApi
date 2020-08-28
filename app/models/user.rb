class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true 
    validates :password, length: { minimum: 8 }
    # Image is optional

    has_many :movies, dependent: :destroy
end
