class AddTweetsFetchedCountToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tweets_fetched_count, :integer, default: 0
  end
end
