class AddMovieColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :actors, :string
    add_column :movies, :genre, :string
    add_column :movies, :language, :string
    add_column :movies, :country, :string
    add_column :movies, :runtime, :string
    add_column :movies, :imdb_rating, :string
    add_column :movies, :production, :string
  end
end
