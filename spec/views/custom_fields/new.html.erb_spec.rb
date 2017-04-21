require 'rails_helper'
require 'spec_helper'

describe "custom_fields/new" do
  before do
    @model_type = 'Household'
    @custom_fields = build_list(:custom_field, 3, model_type: 'Household', id: 1)
    @custom_field = build(:custom_field, model_type: 'Household')
    @sections = build_list(:custom_section, 3, model_type: 'Household')
  end

  it "renders" do
    render
    expect(rendered).to be
  end
end
