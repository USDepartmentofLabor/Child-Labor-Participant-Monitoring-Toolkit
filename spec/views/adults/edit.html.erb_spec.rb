require 'rails_helper'
require 'spec_helper'

describe "adults/edit" do
  before(:each) do
    @adult = create(:adult,
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :sex => 1
    )

    @sections = create_list(:custom_section, 2)
  end

  it "renders the edit adult form" do
    render

    assert_select "form[action=?][method=?]", household_adult_path(@adult.household_id, @adult.id), "post" do
      assert_select "select[name=?]", "adult[intake_date(1i)]"
      assert_select "select[name=?]", "adult[dob(1i)]"
      assert_select "input[name=?]", "adult[is_beneficiary]"
      assert_select "input[name=?]", "adult[first_name]"
      assert_select "input[name=?]", "adult[last_name]"
      assert_select "input[name=?]", "adult[middle_name]"
      assert_select "input[name=?]", "adult[sex]"
      assert_select "select[name=?]", "adult[relationship_id]"
      assert_select "input[name=?]", "adult[relationship_other]"

      assert_select "h3.box-title", :count => 3
    end
  end
end
