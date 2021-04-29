class ChangeUserIdToAuthorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :user_id, :author_id
    rename_column :genres, :user_id, :author_id
  end
end
