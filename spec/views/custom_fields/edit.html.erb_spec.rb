require 'rails_helper'
require 'spec_helper'

describe "custom_fields/edit" do
  it "renders" do
    @custom_field = build(:custom_field)
    @sections = build_list(:custom_section, 3)
    render
    expect(rendered).to be
  end
end
