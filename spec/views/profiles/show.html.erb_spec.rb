require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :image_data => "MyText",
      :first_name => "First Name",
      :last_name => "Last Name",
      :dob => "Dob",
      :bio => "MyText",
      :street_address => "MyText",
      :city => "City",
      :postal_code => "Postal Code",
      :state => "State",
      :country_code => "Country Code",
      :identification => "Identification"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Dob/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/Identification/)
  end
end
