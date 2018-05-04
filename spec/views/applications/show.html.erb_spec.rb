require 'rails_helper'

RSpec.describe "applications/show", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      :user => nil,
      :job => nil,
      :approved => false,
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
