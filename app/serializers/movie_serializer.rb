class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :release_year, :plot, :poster

  attribute :user do |movie|
    {
      id: movie.user.id,
      username: movie.user.username
    }
  end
end
