class AddAmountToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :amount, :float
  end
end
