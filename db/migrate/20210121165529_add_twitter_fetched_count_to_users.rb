class AddTwitterFetchedCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_fetched_count, :integer, default: 0
  end
end
