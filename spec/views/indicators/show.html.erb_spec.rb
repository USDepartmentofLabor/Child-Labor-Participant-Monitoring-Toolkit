require 'rails_helper'

RSpec.describe "indicators/show", type: :view do
  before(:each) do
    @indicator = create :indicator
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Indicator/)
    expect(rendered).to match(/Indicator Type/)
    expect(rendered).to match(/Use/)
    expect(rendered).to match(/Definitions/)
    expect(rendered).to match(/100/)
  end
end
