require 'rails_helper'

RSpec.describe "households/index", type: :view do
  before(:each) do
    assign(:households, [
      Household.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :country => "Country",
        :phone => "Phone"
      ),
      Household.create!(
        :name => "Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :country => "Country",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of households" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
