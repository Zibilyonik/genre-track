class ChangeDescriptionToIconOnGenres < ActiveRecord::Migration[6.1]
  def change
    change_column :genres, :description, :icon
  end
end
