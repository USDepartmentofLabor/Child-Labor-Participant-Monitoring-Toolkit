require 'rails_helper'

RSpec.describe "children/edit", type: :view do
  before(:each) do
    @child = assign(:child, Child.create!(
      :fname => "MyString",
      :lname => "MyString",
      :mname => "MyString",
      :sex => 1,
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit child form" do
    render

    assert_select "form[action=?][method=?]", child_path(@child), "post" do

      assert_select "input#child_fname[name=?]", "child[fname]"

      assert_select "input#child_lname[name=?]", "child[lname]"

      assert_select "input#child_mname[name=?]", "child[mname]"

      assert_select "input#child_sex[name=?]", "child[sex]"

      assert_select "input#child_address[name=?]", "child[address]"

      assert_select "input#child_city[name=?]", "child[city]"

      assert_select "input#child_state[name=?]", "child[state]"

      assert_select "input#child_country[name=?]", "child[country]"
    end
  end
end
