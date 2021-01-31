class AddTwitterHandleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_handle, :string
  end
end
