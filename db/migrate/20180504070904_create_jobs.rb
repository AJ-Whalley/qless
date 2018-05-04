class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.text :street_address
      t.string :city
      t.decimal :latitude
      t.decimal :longitude
      t.string :title
      t.timestampz :started_at
      t.timestampz :completed_at
      t.decimal :price
      t.text :instructions
      t.uuid :uuid
      t.text :qrcode_data
      t.text :stripe_charge_id

      t.timestamps
    end
  end
end
