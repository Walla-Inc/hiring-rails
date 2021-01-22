class CreateTwitterHandles < ActiveRecord::Migration[6.1]
  def change
    create_table :twitter_handles do |t|
      t.string :twitter_handle
      t.integer :fetch_count, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
