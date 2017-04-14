require 'rails_helper'

RSpec.describe "indicators/new", type: :view do
  before(:each) do
    assign(:indicator, Indicator.new)
  end

  it "renders new indicator form" do
    render

    assert_select "form[action=?][method=?]", indicators_path, "post" do
      assert_select "input[name=?]", "indicator[code]"
      assert_select "textarea[name=?]", "indicator[indicator]"
      assert_select "textarea[name=?]", "indicator[use]"
      assert_select "textarea[name=?]", "indicator[definitions]"
      assert_select "textarea[name=?]", "indicator[frequency_definitions]"
      assert_select "input[name=?]", "indicator[baseline]"
      assert_select "select[name=?]", "indicator[unit_of_measure_id]"
      assert_select "select[name=?]", "indicator[reporting_frequency_id]"
    end
  end
end
