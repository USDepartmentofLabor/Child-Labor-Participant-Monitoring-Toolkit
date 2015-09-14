require 'rails_helper'

RSpec.describe "indicators/new", type: :view do
  before(:each) do
    assign(:indicator, Indicator.new(
      :code => "MyString",
      :desc => "MyText",
      :indicator_type => "MyString",
      :string => "MyString",
      :user_id => 1,
      :project => nil
    ))
  end

  it "renders new indicator form" do
    render

    assert_select "form[action=?][method=?]", indicators_path, "post" do

      assert_select "input#indicator_code[name=?]", "indicator[code]"

      assert_select "textarea#indicator_desc[name=?]", "indicator[desc]"

      assert_select "input#indicator_indicator_type[name=?]", "indicator[indicator_type]"

      assert_select "input#indicator_string[name=?]", "indicator[string]"

      assert_select "input#indicator_user_id[name=?]", "indicator[user_id]"

      assert_select "input#indicator_project_id[name=?]", "indicator[project_id]"
    end
  end
end
