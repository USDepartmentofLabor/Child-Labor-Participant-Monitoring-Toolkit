require 'rails_helper'

RSpec.describe "households/index", type: :view do
  before(:each) do
    assign(:households, [
      Household.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :country => "US",
        :phone => "Phone"
      ),
      Household.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :country => "US",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of households" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
