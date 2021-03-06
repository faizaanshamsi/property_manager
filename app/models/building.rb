class Building < ActiveRecord::Base
  def self.state
    %w{ AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY }
  end

  validates :name, length: { minimum: 1 }
  validates :street_address, length: { minimum: 1 }
  validates :city, length: { minimum: 1 }
  validates :postal_code, length: { minimum: 1 }
  validates_inclusion_of :state, in: self.state
  validates_numericality_of :owner_id, only_integer: true, allow_nil: true

  belongs_to :owner,
    inverse_of: :buildings
end
