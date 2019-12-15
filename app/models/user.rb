class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :username, :length => { :minimum => 4, :maximum => 20 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
