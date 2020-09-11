class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :actors, :genre, :language, :country, :runtime, :plot, :poster,  :release_year, :imdb_rating, :production
end
