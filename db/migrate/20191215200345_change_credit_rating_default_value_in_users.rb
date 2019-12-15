class ChangeCreditRatingDefaultValueInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :credit_rating, '5'
  end
end
