class AddListingCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :listings_count, :integer
  end
end
