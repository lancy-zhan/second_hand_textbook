class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :transaction_id
      t.integer :isbn
      t.string :course
      t.string :photo_url
      t.integer :price
      t.string :description
      t.integer :creator_id
      t.string :quarter
      t.string :school_year
      t.string :tittle

      t.timestamps
    end
  end
end
