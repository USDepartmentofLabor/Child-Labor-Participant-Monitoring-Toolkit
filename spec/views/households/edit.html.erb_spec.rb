require 'rails_helper'

RSpec.describe "households/edit", type: :view do
  before(:each) do
    @household = assign(:household, Household.create!(
      :name => "Name"
    ))
  end

  it "renders the edit household form" do
    render

    assert_select "form[action=?][method=?]", household_path(@household), "post" do
      assert_select "input[name=?]", "household[name]"
    end
  end
end
