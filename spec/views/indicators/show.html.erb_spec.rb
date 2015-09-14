require 'rails_helper'

RSpec.describe "indicators/show", type: :view do
  before(:each) do
    @indicator = assign(:indicator, Indicator.create!(
      :code => "Code",
      :desc => "MyText",
      :indicator_type => "Indicator Type",
      :string => "String",
      :user_id => 1,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Indicator Type/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
