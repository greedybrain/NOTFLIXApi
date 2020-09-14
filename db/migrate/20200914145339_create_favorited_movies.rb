class CreateFavoritedMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :favorited_movies do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
