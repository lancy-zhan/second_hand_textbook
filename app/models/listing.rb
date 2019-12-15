class Listing < ApplicationRecord
  mount_uploader :photo_url, PhotoUrlUploader

  # Direct associations

  belongs_to :creator,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :creator_id, :presence => true

  validates :isbn, :length => { :minimum => 10, :maximum => 13, :allow_blank => true }

  validates :tittle, :presence => true

end
