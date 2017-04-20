require 'rails_helper'
require 'spec_helper'

describe "children/show" do
  before(:each) do
    @child = create(:child)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@child.first_name)
    expect(rendered).to match(@child.last_name)
    expect(rendered).to match(@child.middle_name)
  end
end
