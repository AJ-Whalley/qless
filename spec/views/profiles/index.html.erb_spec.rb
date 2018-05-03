require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
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
      ),
      Profile.create!(
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
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Dob".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => "Identification".to_s, :count => 2
  end
end
