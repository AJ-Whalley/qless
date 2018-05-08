class Job < ApplicationRecord
  belongs_to :user
  # has :users
  has_and_belongs_to_many :applicants, class_name: 'User', join_table: :applications
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