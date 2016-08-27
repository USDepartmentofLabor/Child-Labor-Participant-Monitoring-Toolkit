require 'rails_helper'

RSpec.describe "households/new", type: :view do
  before(:each) do
    assign(:household, Household.new(
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new household form" do
    render

    assert_select "form[action=?][method=?]", households_path, "post" do

      assert_select "input#household_name[name=?]", "household[name]"

      assert_select "input#household_address[name=?]", "household[address]"

      assert_select "input#household_city[name=?]", "household[city]"

      assert_select "input#household_state[name=?]", "household[state]"

      assert_select "input#household_country[name=?]", "household[country]"

      assert_select "input#household_phone[name=?]", "household[phone]"
    end
  end
end
