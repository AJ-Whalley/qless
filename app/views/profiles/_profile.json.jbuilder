json.extract! profile, :id, :user_id, :image_data, :first_name, :last_name, :dob, :bio, :street_address, :city, :postal_code, :state, :country_code, :identification, :created_at, :updated_at
json.url profile_url(profile, format: :json)
