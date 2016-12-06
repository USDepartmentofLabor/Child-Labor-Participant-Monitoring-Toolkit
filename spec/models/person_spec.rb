require 'rails_helper'

RSpec.describe Person, type: :model do

  before(:each) do
    @person = FactoryGirl.build(:person)
  end

  it 'should be valid' do
    expect(@person).to be_valid
  end

end
