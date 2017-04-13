require 'rails_helper'

RSpec.describe "indicators/index", type: :view do
  it "renders a table to hold indicators" do
    render
    assert_select "table#indicators-data-table"
  end
end
