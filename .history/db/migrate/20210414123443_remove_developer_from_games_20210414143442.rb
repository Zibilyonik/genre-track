class RemoveDeveloperFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :developer, :string
  end
end
