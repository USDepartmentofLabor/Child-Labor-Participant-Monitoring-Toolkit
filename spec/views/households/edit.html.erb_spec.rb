require 'rails_helper'

RSpec.describe "households/edit", type: :view do
  before(:each) do
    @household = assign(:household, Household.create!(
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit household form" do
    render

    assert_select "form[action=?][method=?]", household_path(@household), "post" do

      assert_select "input#household_name[name=?]", "household[name]"

      assert_select "input#household_address[name=?]", "household[address]"

      assert_select "input#household_city[name=?]", "household[city]"

      assert_select "input#household_state[name=?]", "household[state]"

      assert_select "input#household_country[name=?]", "household[country]"

      assert_select "input#household_phone[name=?]", "household[phone]"
    end
  end
end
