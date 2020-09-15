class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :movies, :favorited_movies
end
