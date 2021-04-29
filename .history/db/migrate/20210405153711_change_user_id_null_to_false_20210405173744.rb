class ChangeUserIdNullToFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :games, :user_id, false
    change_column_null :genres, :user_id, false
  end
end
