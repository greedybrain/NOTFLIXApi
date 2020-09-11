class AddMovieIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :movie_id, :integer
  end
end
