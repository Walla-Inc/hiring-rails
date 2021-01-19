class AddTwitterHandleAndTimeFetched < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_handle, :string, default: '', null: false
    add_column :users, :time_fetched, :integer, default: 0, null: false
  end
end
