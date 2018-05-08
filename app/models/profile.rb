class Profile < ApplicationRecord
  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

  
  belongs_to :user

  validates(
    :image,
    :first_name,
    :last_name,
    :street_address,
    :city,
    :state,
    :postal_code,
    :country_code,
    presence: true) 

  geocoded_by :full_address
  after_validation :geocode

def full_address
  "#{street_address}, #{city}, #{state}, #{postal_code}, #{country_code},"
end 


end
