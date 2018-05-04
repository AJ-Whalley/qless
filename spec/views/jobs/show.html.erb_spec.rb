require 'rails_helper'

RSpec.describe "jobs/show", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
