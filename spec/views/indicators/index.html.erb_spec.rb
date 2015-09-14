require 'rails_helper'

RSpec.describe "indicators/index", type: :view do
  before(:each) do
    assign(:indicators, [
      Indicator.create!(
        :code => "Code",
        :desc => "MyText",
        :indicator_type => "Indicator Type",
        :string => "String",
        :user_id => 1,
        :project => nil
      ),
      Indicator.create!(
        :code => "Code",
        :desc => "MyText",
        :indicator_type => "Indicator Type",
        :string => "String",
        :user_id => 1,
        :project => nil
      )
    ])
  end

  it "renders a list of indicators" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Indicator Type".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
