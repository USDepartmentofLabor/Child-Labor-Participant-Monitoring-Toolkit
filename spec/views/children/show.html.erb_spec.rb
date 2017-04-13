require 'rails_helper'
require 'spec_helper'

describe "children/show" do
  before(:each) do
    @child = create(:child)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/FN 1/)
    expect(rendered).to match(/LN 1/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/1/)
  end
end
