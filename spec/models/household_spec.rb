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

end
