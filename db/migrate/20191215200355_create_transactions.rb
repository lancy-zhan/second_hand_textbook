class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.boolean :sold_status
      t.boolean :completed_status
      t.string :location
      t.datetime :time
      t.integer :listing_id

      t.timestamps
    end
  end
end
