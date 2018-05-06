class Job < ApplicationRecord
  belongs_to :user
  has_many :applications

  validates(
    :street_address,
    :city,
    presence: true) 

  geocoded_by :full_address
  after_validation :geocode

def full_address
  "#{street_address}, #{city}"
end 

end 