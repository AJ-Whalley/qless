require 'rails_helper'

RSpec.describe "applications/new", type: :view do
  before(:each) do
    assign(:application, Application.new(
      :user => nil,
      :job => nil,
      :approved => false,
      :comment => "MyText"
    ))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", applications_path, "post" do

      assert_select "input[name=?]", "application[user_id]"

      assert_select "input[name=?]", "application[job_id]"

      assert_select "input[name=?]", "application[approved]"

      assert_select "textarea[name=?]", "application[comment]"
    end
  end
end
