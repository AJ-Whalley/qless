class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :image_data
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.text :bio
      t.text :street_address
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country_code
      t.string :identification

      t.timestamps
    end
  end
end
