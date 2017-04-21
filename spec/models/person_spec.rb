require 'spec_helper'
require 'rails_helper'

describe Person do

  before(:each) do
    @person = build(:person)
  end

  it 'should be valid' do
    expect(@person).to be_valid
  end

  it 'should generate full name' do
    @person.first_name = 'First'
    @person.last_name = 'Last'
    expect(@person.full_name).to eq('First Last')
  end

  it 'should generate full name with middle name' do
    @person.first_name = 'First'
    @person.last_name = 'Last'
    @person.middle_name = 'Middle'
    expect(@person.full_name).to eq('First Middle Last')
  end

  it 'should scope to adults' do
    create_list(:person, 5, age: 22)
    create_list(:person, 5, age: 10)
    expect(Person.who_are_adults.length).to eq(5)
  end

  it 'should scope to children' do
    create_list(:person, 5, age: 22)
    create_list(:person, 5, age: 10)
    expect(Person.who_are_children.length).to eq(5)
  end

  it 'should translate gender ID to name' do
    @person.sex = 1
    expect(Person.gender_name(@person.sex)).to eq('Male')

    @person.sex = 2
    expect(Person.gender_name(@person.sex)).to eq('Female')
  end

end
