class Owner < ActiveRecord::Base
  validates :first_name, length: { minimum: 1 }
  validates :last_name, length: { minimum: 1 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  has_many :buildings,
    dependent: :nullify,
    inverse_of: :owner
end
