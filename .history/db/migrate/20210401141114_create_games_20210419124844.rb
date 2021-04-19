class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :name
      t.text :amount

      t.timestamps
    end
  end
end
