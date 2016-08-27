require 'rails_helper'

RSpec.describe "children/show", type: :view do
  before(:each) do
    @child = assign(:child, Child.create!(
      :fname => "Fname",
      :lname => "Lname",
      :mname => "Mname",
      :sex => 1,
      :address => "Address",
      :city => "City",
      :state => "State",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fname/)
    expect(rendered).to match(/Lname/)
    expect(rendered).to match(/Mname/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
  end
end
