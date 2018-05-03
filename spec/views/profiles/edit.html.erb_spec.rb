require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :image_data => "MyText",
      :first_name => "MyString",
      :last_name => "MyString",
      :dob => "MyString",
      :bio => "MyText",
      :street_address => "MyText",
      :city => "MyString",
      :postal_code => "MyString",
      :state => "MyString",
      :country_code => "MyString",
      :identification => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "textarea[name=?]", "profile[image_data]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[dob]"

      assert_select "textarea[name=?]", "profile[bio]"

      assert_select "textarea[name=?]", "profile[street_address]"

      assert_select "input[name=?]", "profile[city]"

      assert_select "input[name=?]", "profile[postal_code]"

      assert_select "input[name=?]", "profile[state]"

      assert_select "input[name=?]", "profile[country_code]"

      assert_select "input[name=?]", "profile[identification]"
    end
  end
end
