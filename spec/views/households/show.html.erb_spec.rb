require 'rails_helper'

RSpec.describe "households/show", type: :view do
  before(:each) do
    @household = assign(:household, Household.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
