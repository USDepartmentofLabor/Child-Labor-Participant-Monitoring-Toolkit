require 'rails_helper'
require 'spec_helper'
require 'pp'

describe "children/index" do
  before(:each) do
    @children =
      create_list(:child, 2, first_name: 'Fname', last_name: 'Lname', sex: 1,
                  age: 11, intake_date: '2017-01-01')
  end

  it "renders a list of children" do
    render

    expect(rendered).to have_selector("tr>td", :text => "Fname", :count => 2)
    expect(rendered).to have_selector("tr>td", :text => "Lname", :count => 2)
    expect(rendered).to have_selector("tr>td", :text => "Boy", :count => 2)
    expect(rendered).to have_selector("tr>td", :text => "11", :count => 2)
    expect(rendered).to have_selector("tr>td", :text => "2017-01-01", :count => 2)
  end
end
