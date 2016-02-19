require 'rails_helper'

RSpec.describe Household, type: :model do

  before(:each) do
    @household = FactoryGirl.build(:household)
  end

  it 'should be valid' do
    expect(@household).to be_valid
  end

  it 'is invalid without name' do
    @household.name = nil
    expect(@household).not_to be_valid
  end

  it 'is invalid with country.length > 2' do
    @household.country = "USA"
    expect(@household).not_to be_valid
  end

  it 'should have nil country name if county is nil' do
    @household.country = nil
    expect(@household.country_name).to be nil
  end

  it 'should return country name' do
    expect(@household.country_name).to_not be nil
  end

end
