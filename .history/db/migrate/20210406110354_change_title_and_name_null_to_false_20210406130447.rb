class ChangeTitleAndNameNullToFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :games, :title, false
    change_column_null :genres, :name, false
  end
end
