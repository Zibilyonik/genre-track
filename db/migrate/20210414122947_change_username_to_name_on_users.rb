# frozen_string_literal: true

class ChangeUsernameToNameOnUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :name
  end
end
