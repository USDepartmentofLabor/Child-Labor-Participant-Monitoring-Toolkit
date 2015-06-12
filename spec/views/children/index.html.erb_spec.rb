require 'rails_helper'

RSpec.describe "children/index", type: :view do
  before(:each) do
    assign(:children, [
      Child.create!(
        :fname => "Fname",
        :lname => "Lname",
        :mname => "Mname",
        :sex => 1,
        :address => "Address",
        :city => "City",
        :state => "State",
        :country => "Country"
      ),
      Child.create!(
        :fname => "Fname",
        :lname => "Lname",
        :mname => "Mname",
        :sex => 1,
        :address => "Address",
        :city => "City",
        :state => "State",
        :country => "Country"
      )
    ])
  end

  it "renders a list of children" do
    render
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    assert_select "tr>td", :text => "Mname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
