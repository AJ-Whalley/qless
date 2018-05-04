require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :user => nil,
        :street_address => "MyText",
        :city => "City",
        :latitude => "9.99",
        :longitude => "9.99",
        :title => "Title",
        :started_at => "",
        :completed_at => "",
        :price => "9.99",
        :instructions => "MyText",
        :uuid => "",
        :qrcode_data => "MyText",
        :stripe_charge_id => "MyText"
      ),
      Job.create!(
        :user => nil,
        :street_address => "MyText",
        :city => "City",
        :latitude => "9.99",
        :longitude => "9.99",
        :title => "Title",
        :started_at => "",
        :completed_at => "",
        :price => "9.99",
        :instructions => "MyText",
        :uuid => "",
        :qrcode_data => "MyText",
        :stripe_charge_id => "MyText"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
