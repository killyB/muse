class AddTwitterUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitterURL, :string
  end
end
