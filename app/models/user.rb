class User < ApplicationRecord
  # Direct associations

  has_many   :listings,
             :foreign_key => "creator_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => { :case_sensitive => true }

  validates :username, :presence => true

  validates :username, :length => { :minimum => 4, :maximum => 20 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
