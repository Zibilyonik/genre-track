class ChangeUsernameToNameOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :username, :name
  end
end
