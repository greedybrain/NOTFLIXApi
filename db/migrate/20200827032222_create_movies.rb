class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_year
      t.text :plot
      t.string :poster
      t.belongs_to :user

      t.timestamps
    end
  end
end
