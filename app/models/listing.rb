class Listing < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :isbn, :length => { :minimum => 10, :maximum => 13, :allow_blank => true }

  validates :tittle, :presence => true

end
