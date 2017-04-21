require 'rails_helper'
require 'spec_helper'

describe Household do

  before(:each) do
    @household = create(:household)
  end

  it 'should be valid' do
    expect(@household).to be_valid
  end

  it 'is invalid without name' do
    @household.name = nil
    expect(@household).not_to be_valid
  end

  it 'has custom sections' do
    create_list(:custom_section, 3, model_type: 'Household')
    expect(@household.custom_sections.length).to eq(3)
  end

  it 'has children' do
    create_list(:child, 3, household_id: @household.id)
    expect(@household.children.length).to eq(3)
  end

  it 'has adults' do
    create_list(:adult, 2, household_id: @household.id)
    expect(@household.adults.length).to eq(2)
  end

end
