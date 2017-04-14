require 'rails_helper'

RSpec.describe "households/new", type: :view do
  before(:each) do
    assign(:household, Household.new)
  end

  it "renders new household form" do
    render

    assert_select "form[action=?][method=?]", households_path, "post" do
      assert_select "input[name=?]", "household[name]"
    end
  end
end
