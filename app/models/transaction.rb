class Transaction < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :buyer_id, :presence => true

  validates :seller_id, :presence => true

end
