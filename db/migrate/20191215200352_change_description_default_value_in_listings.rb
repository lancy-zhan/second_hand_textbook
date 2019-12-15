class ChangeDescriptionDefaultValueInListings < ActiveRecord::Migration[5.1]
  def change
    change_column_default :listings, :description, 'This listed item has no description. '
  end
end
