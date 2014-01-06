class Owner < ActiveRecord::Base
  validates :first_name, length: { minimum: 1 }
  validates :last_name, length: { minimum: 1 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  has_many :buildings,
    inverse_of: :owner,
    dependent: :nullify
end
