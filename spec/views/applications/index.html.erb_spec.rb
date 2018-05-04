require 'rails_helper'

RSpec.describe "applications/index", type: :view do
  before(:each) do
    assign(:applications, [
      Application.create!(
        :user => nil,
        :job => nil,
        :approved => false,
        :comment => "MyText"
      ),
      Application.create!(
        :user => nil,
        :job => nil,
        :approved => false,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of applications" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
