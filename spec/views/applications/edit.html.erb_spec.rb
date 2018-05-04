require 'rails_helper'

RSpec.describe "applications/edit", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      :user => nil,
      :job => nil,
      :approved => false,
      :comment => "MyText"
    ))
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_path(@application), "post" do

      assert_select "input[name=?]", "application[user_id]"

      assert_select "input[name=?]", "application[job_id]"

      assert_select "input[name=?]", "application[approved]"

      assert_select "textarea[name=?]", "application[comment]"
    end
  end
end
