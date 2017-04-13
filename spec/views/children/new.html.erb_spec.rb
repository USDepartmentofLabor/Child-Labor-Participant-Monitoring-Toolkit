require 'rails_helper'

RSpec.describe "children/new", type: :view do
  before(:each) do
    assign(:child, Child.new)

    @sections = create_list(:custom_section, 2)
  end

  it "renders the new child form" do
    render

    assert_select "form[action=?][method=?]", children_path, "post" do
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
