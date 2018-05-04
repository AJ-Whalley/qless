require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :user => nil,
      :street_address => "MyText",
      :city => "MyString",
      :latitude => "9.99",
      :longitude => "9.99",
      :title => "MyString",
      :started_at => "",
      :completed_at => "",
      :price => "9.99",
      :instructions => "MyText",
      :uuid => "",
      :qrcode_data => "MyText",
      :stripe_charge_id => "MyText"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input[name=?]", "job[user_id]"

      assert_select "textarea[name=?]", "job[street_address]"

      assert_select "input[name=?]", "job[city]"

      assert_select "input[name=?]", "job[latitude]"

      assert_select "input[name=?]", "job[longitude]"

      assert_select "input[name=?]", "job[title]"

      assert_select "input[name=?]", "job[started_at]"

      assert_select "input[name=?]", "job[completed_at]"

      assert_select "input[name=?]", "job[price]"

      assert_select "textarea[name=?]", "job[instructions]"

      assert_select "input[name=?]", "job[uuid]"

      assert_select "textarea[name=?]", "job[qrcode_data]"

      assert_select "textarea[name=?]", "job[stripe_charge_id]"
    end
  end
end
