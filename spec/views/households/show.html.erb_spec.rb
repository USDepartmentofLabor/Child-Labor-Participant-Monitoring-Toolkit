require 'rails_helper'

RSpec.describe "households/show", type: :view do
  before(:each) do
    @household = assign(:household, Household.create!(
      :name => "Name",
      :address => "Address",
      :city => "City",
      :state => "State",
      :country => "Country",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
  end
end
