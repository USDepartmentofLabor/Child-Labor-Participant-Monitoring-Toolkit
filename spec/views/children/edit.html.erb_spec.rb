require 'rails_helper'
require 'spec_helper'
require 'pp'

describe "children/edit" do
  before(:each) do
    @child = create(:child,
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :sex => 1
    )

    @sections = create_list(:custom_section, 2)
  end

  it "renders the edit child form" do
    render

    assert_select "form[action=?][method=?]", child_path(@child), "post" do
      assert_select "select[name=?]", "child[household_id]"
      assert_select "select[name=?]", "child[intake_date(1i)]"
      assert_select "input[name=?]", "child[is_beneficiary]"
      assert_select "input[name=?]", "child[first_name]"
      assert_select "input[name=?]", "child[last_name]"
      assert_select "input[name=?]", "child[middle_name]"
      assert_select "input[name=?]", "child[sex]"

      assert_select "h3.box-title", :count => 3
    end
  end
end
