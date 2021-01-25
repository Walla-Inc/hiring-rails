class AddTwitterHandleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_handle, :string
    add_column :users, :number_of_access, :integer, default: 0
  end
end
