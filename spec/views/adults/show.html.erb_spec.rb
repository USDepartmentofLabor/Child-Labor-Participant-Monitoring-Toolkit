require 'rails_helper'
require 'spec_helper'

describe "adults/show" do
  before(:each) do
    @adult = create(:adult)
  end

  it "renders" do
    render
    expect(rendered).to be
  end
end
