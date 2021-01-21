class AddTwitterHandleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_handle, :string
    add_column :users, :fetched_times, :int, default: 0
  end
end
