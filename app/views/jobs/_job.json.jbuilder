json.extract! job, :id, :user_id, :street_address, :city, :latitude, :longitude, :title, :started_at, :completed_at, :price, :instructions, :uuid, :qrcode_data, :stripe_charge_id, :created_at, :updated_at
json.url job_url(job, format: :json)
