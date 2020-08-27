class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :movies
end
